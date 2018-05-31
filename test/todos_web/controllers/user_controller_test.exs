defmodule TodosWeb.UserControllerTest do
  use TodosWeb.ConnCase

  alias Todos.Users
  alias Todos.Users.User

  @create_attrs %{birthdate: "2010-04-17T14:00:00.000000Z", first_name: "some first_name", is_admin: true, last_name: "some last_name"}
  @update_attrs %{birthdate: "2011-05-18T15:01:01.000000Z", first_name: "some updated first_name", is_admin: false, last_name: "some updated last_name"}
  @invalid_attrs %{birthdate: nil, first_name: nil, is_admin: nil, last_name: nil}

  def fixture(:user) do
    {:ok, user} = Users.create_user(@create_attrs)
    user
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all users", %{conn: conn} do
      conn = get conn, user_path(conn, :index)
      assert json_response(conn, 200) == []
    end
  end

  describe "create user" do
    test "renders user when data is valid", %{conn: conn} do
      conn = post conn, user_path(conn, :create), user: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)

      conn = get conn, user_path(conn, :show, id)
      assert json_response(conn, 200) == %{
        "id" => id,
        "birthdate" => "2010-04-17T14:00:00.000000Z",
        "first_name" => "some first_name",
        "is_admin" => true,
        "last_name" => "some last_name",
        "tasks" => []}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, user_path(conn, :create), user: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update user" do
    setup [:create_user]

    test "renders user when data is valid", %{conn: conn, user: %User{id: id} = user} do
      conn = put conn, user_path(conn, :update, user), user: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)

      conn = get conn, user_path(conn, :show, id)
      assert json_response(conn, 200) == %{
        "id" => id,
        "birthdate" => "2011-05-18T15:01:01.000000Z",
        "first_name" => "some updated first_name",
        "is_admin" => false,
        "last_name" => "some updated last_name",
        "tasks" => []}
    end

    test "renders errors when data is invalid", %{conn: conn, user: user} do
      conn = put conn, user_path(conn, :update, user), user: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete user" do
    setup [:create_user]

    test "deletes chosen user", %{conn: conn, user: user} do
      conn = delete conn, user_path(conn, :delete, user)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, user_path(conn, :show, user)
      end
    end
  end

  defp create_user(_) do
    user = fixture(:user)
    {:ok, user: user}
  end
end
