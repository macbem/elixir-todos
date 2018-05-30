defmodule Todos.Users.User do
  use Ecto.Schema
  import Ecto.Changeset


  schema "users" do
    field :birthdate, :utc_datetime
    field :first_name, :string
    field :is_admin, :boolean, default: false
    field :last_name, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:first_name, :last_name, :birthdate, :is_admin])
    |> validate_required([:first_name, :last_name, :birthdate, :is_admin])
  end
end
