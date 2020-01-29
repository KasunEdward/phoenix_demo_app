defmodule DemoAppWeb.Router do
  use DemoAppWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", DemoAppWeb do
    pipe_through :browser

    get "/", PageController, :index

  end

  scope "/api/v1", DemoAppWeb do
    pipe_through :api

    get "/users", UserController, :get_all
    post "/users", UserController, :add_user
    delete "/users/:id", UserController, :delete_user


  end
end
