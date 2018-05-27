defmodule Todos.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :title, :string
      add :is_done, :boolean, default: false, null: false
      add :due_date, :utc_datetime
      add :description, :text

      timestamps()
    end

  end
end
