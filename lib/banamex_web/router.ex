defmodule BanamexWeb.Router do
  use BanamexWeb, :router

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

  scope "/", BanamexWeb do
    pipe_through :browser
    get    "/login",  SessionController, :new
    post   "/login",  SessionController, :create
    delete "/logout", SessionController, :delete
    resources "/users", UserController
    resources "/cuentas", CuentaController
    resources "/cajeros", CajeroController
    resources "/atm", AtmController 
    resources "/call", CallCentersController
    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", BanamexWeb do
  #   pipe_through :api
  # end
end
