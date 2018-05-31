defmodule Todos.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset


  schema "tasks" do
    field :description, :string
    field :due_date, :utc_datetime
    field :is_done, :boolean, default: false
    field :title, :string
    belongs_to :user, Todos.Users.User

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:title, :is_done, :due_date, :description])
    |> validate_required([:title, :due_date])
  end
end
