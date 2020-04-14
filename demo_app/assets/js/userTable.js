import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import MaterialTable from 'material-table';
import AppBar from '@material-ui/core/AppBar';



class UserTable extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      columns: [
        { title: 'Id', field: 'id', hidden: true },
        { title: 'Name', field: 'name' },
        { title: 'Age', field: 'age' }
      ],
    }
  }

  render() {
    return (
      <div> 
      <AppBar color="primary" position="static">
          <h1>User Demo</h1>
      </AppBar>
      <MaterialTable
        title="User Details"
        columns={this.state.columns}
        options={{
          padding: "dense",
          rowStyle: rowData => ({
            backgroundColor: (rowData.tableData.id % 2 == 1) ? '#EEE' : '#FFF'
          })
        }}
        data={query =>
          new Promise((resolve, reject) => {
            let url = 'http://localhost:4000/api/v1/users'
            // url += '&page=' + (query.page + 1)
            fetch(url)
              .then(response => response.json())
              .then(result => {
                resolve({
                  data: result.data,
                  page: query.page,
                  totalCount: result.total,
                })
              })
          })
        }
        editable={{
          onRowAdd: newData =>
            new Promise((resolve, reject) => {
                let url = 'http://localhost:4000/api/v1/users'
            // url += '&page=' + (query.page + 1)
            console.log(newData)
            fetch(url, {
                method: 'POST',
                body: JSON.stringify(newData),
                headers:{ 'Content-Type': 'application/json' }
            })
              .then(response => response.json())
              .then(result => {
                resolve({
                  data: result.data,
                  page: 0,
                  totalCount: result.total,
                })
              })
            }),
          onRowUpdate: (newData, oldData) =>
            new Promise((resolve, reject) => {
              setTimeout(() => {
                {
                  const data = this.state.data;
                  const index = data.indexOf(oldData);
                  data[index] = newData;
                  this.setState({ data }, () => resolve());
                }
                resolve()
              }, 1000)
            }),
          onRowDelete: oldData =>
            new Promise((resolve, reject) => {
                let url = 'http://localhost:4000/api/v1/users/' + oldData["id"]
                console.log(oldData)
                fetch(url, {
                    method: 'DELETE'
                })
                .then(response => response.json())
                .then(result => {
                    resolve({
                    data: result.data,
                    page: 0,
                    totalCount: result.total,
                    })
              })
            }),
        }}
      />  
      </div>
    )
  }
}

export default UserTable;
