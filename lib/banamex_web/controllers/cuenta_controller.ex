defmodule BanamexWeb.CuentaController do
  use BanamexWeb, :controller
  import Ecto.Query
  import Ecto.Repo
  import Logger
  alias Banamex.Cuentas
  alias Banamex.Cuentas.Cuenta

  def index(conn, _params) do
    if Banamex.Accounts.Auth.logged_in?(conn) do

      current = Banamex.Accounts.Auth.current_user(conn)

      c = from u in "cuentas",
                where: u.user_id == ^current.id,
                select: [u.saldo,u.no_cta,u.id]
      cuenta = Banamex.Repo.all(c)
      render(conn, "index.html", cuentas: cuenta, usuario: current)
    else
      render(conn,"no_auth.html")
    end
  end

  def new(conn, _params) do
    if Banamex.Accounts.Auth.logged_in?(conn) do
      current = Banamex.Accounts.Auth.current_user(conn)
      if (current.tipo == 1) do
        users = Banamex.Accounts.list_users()
        changeset = Cuentas.change_cuenta(%Cuenta{})
        render(conn, "new.html", changeset: changeset,users: users)
      else
        render(conn,"no_auth2.html")
      end
    else
      render(conn,"no_auth.html")
    end
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
  def edit2(conn, %{"id" => id}) do
    cuenta = Cuentas.get_cuenta!(id)
    changeset = Cuentas.change_cuenta(cuenta)
    render(conn, "edit3.html", cuenta: cuenta, changeset: changeset)
  end

  def edit(conn, %{"id" => id}) do
    cuenta = Cuentas.get_cuenta!(id)
    changeset = Cuentas.change_cuenta(cuenta)
    render(conn, "edit.html", cuenta: cuenta, changeset: changeset)
  end


  #
#  def update(conn, %{"id" => id, "cuenta" => cuenta_params}) do
#    cuenta = Cuentas.get_cuenta!(id)
#    case Cuentas.update_cuenta(cuenta, cuenta_params) do
#      {:ok, cuenta} ->
#        conn
#        |> put_flash(:info, "Cuenta updated successfully.")
#        |> redirect(to: Routes.cuenta_path(conn, :show, cuenta))

#      {:error, %Ecto.Changeset{} = changeset} ->
#        render(conn, "edit.html", cuenta: cuenta, changeset: changeset)
#    end
 # end
  
 def update(conn, %{"id" => id, "cuenta" => cuenta_params}) do
  cuenta = Cuentas.get_cuenta!(id)
  Logger.info inspect(cuenta_params)
  Logger.debug "#{inspect(cuenta_params[:monto])}"
  if cuenta.saldo < 100 do
    render(conn, "error.html", cuenta: cuenta)
  else 
    case Cuentas.update_cuenta(cuenta, cuenta_params) do
            {:ok, cuenta} ->
              conn
              |> put_flash(:info, "Cuenta updated successfully.")
              |> redirect(to: Routes.cuenta_path(conn, :show, cuenta))
      
            {:error, %Ecto.Changeset{} = changeset} ->
              render(conn, "edit.html", cuenta: cuenta, changeset: changeset)
         end
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
