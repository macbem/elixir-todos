defmodule TodosWeb.Router do
  use TodosWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", TodosWeb do
    pipe_through :api

    scope "/v1", V1 do
      resources "/users", UserController, except: [:new, :edit] do
        resources "/tasks", TaskController, except: [:new, :edit]
      end
    end
  end
end
