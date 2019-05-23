defmodule BanamexWeb.UserController do
  use BanamexWeb, :controller
  import Ecto.Query
  import Ecto.Repo
  alias Banamex.Accounts
  alias Banamex.Accounts.User

  def index(conn, _params) do
    if Banamex.Accounts.Auth.logged_in?(conn) do

      current = Banamex.Accounts.Auth.current_user(conn)

      c = from u in "users",
                where: u.id == ^current.id,
                select: [u.id,u.username,u.email,u.telefono]
      user = Banamex.Repo.all(c)
      render(conn, "index.html", users: user, usuario: current)
    else
      render(conn,"no_auth.html")
    end
  end

  def new(conn, _params) do
      changeset = Accounts.change_user(%User{})
      render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
    case Accounts.create_user(user_params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "User created successfully.")
        |> redirect(to: Routes.user_path(conn, :show, user))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    render(conn, "show.html", user: user)
  end

  def edit(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    changeset = Accounts.change_user(user)
    render(conn, "edit.html", user: user, changeset: changeset)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Accounts.get_user!(id)

    case Accounts.update_user(user, user_params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "User updated successfully.")
        |> redirect(to: Routes.user_path(conn, :show, user))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", user: user, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    {:ok, _user} = Accounts.delete_user(user)

    conn
    |> put_flash(:info, "User deleted successfully.")
    |> redirect(to: Routes.user_path(conn, :index))
  end
end
