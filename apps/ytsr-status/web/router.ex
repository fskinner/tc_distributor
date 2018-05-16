defmodule YtsrStatus.Router do
  use YtsrStatus.Web, :router

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

  scope "/", YtsrStatus do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/api", YtsrStatus.Web do  
    pipe_through :api

    scope "/v1" do
      get "/status", StatusController, :index
    end
  end
end
