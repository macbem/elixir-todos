defmodule TodosWeb.V1.TaskView do
  use TodosWeb, :view
  alias TodosWeb.V1.TaskView

  def render("index.json", %{tasks: tasks}) do
    render_many(tasks, TaskView, "task.json")
  end

  def render("show.json", %{task: task}) do
    render_one(task, TaskView, "task.json")
  end

  def render("task.json", %{task: task}) do
    %{
      id: task.id,
      title: task.title,
      is_done: task.is_done,
      due_date: task.due_date,
      description: task.description,
      owner_id: task.user_id
    }
  end
end
