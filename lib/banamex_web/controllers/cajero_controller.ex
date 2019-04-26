defmodule BanamexWeb.CajeroController do
  use BanamexWeb, :controller

  alias Banamex.Cajeros
  alias Banamex.Cajeros.Cajero

  def index(conn, _params) do
    cajeros = Cajeros.list_cajeros()
    render(conn, "index.html", cajeros: cajeros)
  end

  def new(conn, _params) do
    changeset = Cajeros.change_cajero(%Cajero{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"cajero" => cajero_params}) do
    case Cajeros.create_cajero(cajero_params) do
      {:ok, cajero} ->
        conn
        |> put_flash(:info, "Cajero created successfully.")
        |> redirect(to: Routes.cajero_path(conn, :show, cajero))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    cajero = Cajeros.get_cajero!(id)
    render(conn, "show.html", cajero: cajero)
  end

  def edit(conn, %{"id" => id}) do
    cajero = Cajeros.get_cajero!(id)
    changeset = Cajeros.change_cajero(cajero)
    render(conn, "edit.html", cajero: cajero, changeset: changeset)
  end

  def update(conn, %{"id" => id, "cajero" => cajero_params}) do
    cajero = Cajeros.get_cajero!(id)

    case Cajeros.update_cajero(cajero, cajero_params) do
      {:ok, cajero} ->
        conn
        |> put_flash(:info, "Cajero updated successfully.")
        |> redirect(to: Routes.cajero_path(conn, :show, cajero))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", cajero: cajero, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    cajero = Cajeros.get_cajero!(id)
    {:ok, _cajero} = Cajeros.delete_cajero(cajero)

    conn
    |> put_flash(:info, "Cajero deleted successfully.")
    |> redirect(to: Routes.cajero_path(conn, :index))
  end
end
