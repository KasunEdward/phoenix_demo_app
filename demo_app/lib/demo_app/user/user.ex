defmodule DemoApp.User.User do
  import Ecto.Query

  def get_all() do
    DemoApp.User.UserSchema |> select([u],  %{"id" => u.id, "name" => u.name, "age" => u.age}) |> DemoApp.Repo.all
  end

  def add_user(params) do
    case DemoApp.Repo.insert %DemoApp.User.UserSchema{name: params["name"], age: String.to_integer(params["age"])} do
      {:ok, _struct}       -> # Inserted with success
        :ok
      {:error, _changeset} -> # Something went wrong
        :error
    end
  end

  def delete_user(id) do
    user = DemoApp.Repo.get!(DemoApp.User.UserSchema, id)
    case DemoApp.Repo.delete(user) do
      {:ok,_struct} ->
        :ok
      {:error, changeset} ->
        :error
    end
  end

end
