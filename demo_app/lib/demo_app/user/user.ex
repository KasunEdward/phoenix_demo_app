defmodule DemoApp.User.User do
  import Ecto.Query

  def get_all() do
    DemoApp.User.UserSchema |> select([u],  %{"name" => u.name, "age" => u.age}) |> DemoApp.Repo.all

  end

end
