defmodule TodosWeb.V1.UserView do
  use TodosWeb, :view
  alias TodosWeb.V1.UserView
  alias TodosWeb.V1.TaskView

  def render("index.json", %{users: users}) do
    render_many(users, UserView, "user.json")
  end

  def render("show.json", %{user: user}) do
    render_one(user, UserView, "user.json")
  end

  def render("user.json", %{user: user}) do
    %{
      id: user.id,
      first_name: user.first_name,
      last_name: user.last_name,
      birthdate: user.birthdate,
      is_admin: user.is_admin,
      tasks: render_many(user.tasks, TaskView, "task.json"),
    }
  end
end
