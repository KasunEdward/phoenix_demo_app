defmodule DemoAppWeb.UserController do
  use DemoAppWeb, :controller

  def get_all(conn, _params) do
    users = DemoApp.User.User.get_all()
    # IO.puts(users)
    total = length(users)

    json conn, %{"data"=> users, "total" => total }
  end

  def add_user(conn, params) do
    IO.puts("-------------------add_user #{inspect params}")
    case DemoApp.User.User.add_user(params) do
      :ok ->
        users = DemoApp.User.User.get_all()
        total = length(users)
        json conn, %{"success"=> true, "data"=> users, "total" => total}
      _ ->
        json conn, %{"success"=> false}
    end

  end
end
