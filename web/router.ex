defmodule Junkiex.Router do
  use Junkiex.Web, :router

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

  scope "/", Junkiex do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/about", PageController, :about

    get "/logout", AuthController, :logout
    get "/auth", AuthController, :auth
    get "/auth.callback", AuthController, :callback

  end

  # Other scopes may use custom stacks.
  # scope "/api", Junkiex do
  #   pipe_through :api
  # end
end
