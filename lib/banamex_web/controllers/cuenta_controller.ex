defmodule BanamexWeb.CuentaController do
  use BanamexWeb, :controller

  alias Banamex.Cuentas
  alias Banamex.Cuentas.Cuenta

  def index(conn, _params) do
    cuentas = Cuentas.list_cuentas()
    render(conn, "index.html", cuentas: cuentas)
  end

  def new(conn, _params) do
    users = Banamex.Accounts.list_users()
    changeset = Cuentas.change_cuenta(%Cuenta{})
    render(conn, "new.html", changeset: changeset,users: users)
  end

  def create(conn, %{"cuenta" => cuenta_params}) do
    case Cuentas.create_cuenta(cuenta_params) do
      {:ok, cuenta} ->
        conn
        |> put_flash(:info, "Cuenta created successfully.")
        |> redirect(to: Routes.cuenta_path(conn, :show, cuenta))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    cuenta = Cuentas.get_cuenta!(id)
    render(conn, "show.html", cuenta: cuenta)
  end

  def edit(conn, %{"id" => id}) do
    cuenta = Cuentas.get_cuenta!(id)
    changeset = Cuentas.change_cuenta(cuenta)
    render(conn, "edit.html", cuenta: cuenta, changeset: changeset)
  end

  def update(conn, %{"id" => id, "cuenta" => cuenta_params}) do
    cuenta = Cuentas.get_cuenta!(id)

    case Cuentas.update_cuenta(cuenta, cuenta_params) do
      {:ok, cuenta} ->
        conn
        |> put_flash(:info, "Cuenta updated successfully.")
        |> redirect(to: Routes.cuenta_path(conn, :show, cuenta))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", cuenta: cuenta, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    cuenta = Cuentas.get_cuenta!(id)
    {:ok, _cuenta} = Cuentas.delete_cuenta(cuenta)

    conn
    |> put_flash(:info, "Cuenta deleted successfully.")
    |> redirect(to: Routes.cuenta_path(conn, :index))
  end
end
