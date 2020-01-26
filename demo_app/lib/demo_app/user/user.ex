defmodule DemoApp.User.User do
  import Ecto.Query

  def get_all() do
    DemoApp.User.UserSchema |> select([u],  %{"name" => u.name, "age" => u.age}) |> DemoApp.Repo.all
  end

  def add_user(params) do
    case DemoApp.Repo.insert %DemoApp.User.UserSchema{name: params["name"], age: String.to_integer(params["age"])} do
      {:ok, _struct}       -> # Inserted with success
        :ok
      {:error, _changeset} -> # Something went wrong
        :error
    end

  end

end
