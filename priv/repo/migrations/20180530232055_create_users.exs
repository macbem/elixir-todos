defmodule Todos.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :first_name, :string
      add :last_name, :string
      add :birthdate, :utc_datetime
      add :is_admin, :boolean, default: false, null: false

      timestamps()
    end

  end
end
