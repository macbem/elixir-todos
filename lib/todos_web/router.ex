defmodule TodosWeb.Router do
  use TodosWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", TodosWeb do
    pipe_through :api

    scope "/v1", V1 do
      resources "/tasks", TaskController, except: [:new, :edit]
      resources "/users", UserController, except: [:new, :edit]
    end
  end
end
