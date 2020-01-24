defmodule DemoAppWeb.UserController do
  use DemoAppWeb, :controller

  def get_all(conn, _params) do
    users = DemoApp.User.User.get_all()
    # IO.puts(users)
    total = length(users)

    json conn, %{"data"=> users, "total" => total }
  end
end
