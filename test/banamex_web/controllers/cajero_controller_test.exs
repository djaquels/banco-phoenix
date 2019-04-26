defmodule BanamexWeb.CajeroControllerTest do
  use BanamexWeb.ConnCase

  alias Banamex.Cajeros

  @create_attrs %{deposito: 42, retiro: 42, saldo: 120.5}
  @update_attrs %{deposito: 43, retiro: 43, saldo: 456.7}
  @invalid_attrs %{deposito: nil, retiro: nil, saldo: nil}

  def fixture(:cajero) do
    {:ok, cajero} = Cajeros.create_cajero(@create_attrs)
    cajero
  end

  describe "index" do
    test "lists all cajeros", %{conn: conn} do
      conn = get(conn, Routes.cajero_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Cajeros"
    end
  end

  describe "new cajero" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.cajero_path(conn, :new))
      assert html_response(conn, 200) =~ "New Cajero"
    end
  end

  describe "create cajero" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.cajero_path(conn, :create), cajero: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.cajero_path(conn, :show, id)

      conn = get(conn, Routes.cajero_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Cajero"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.cajero_path(conn, :create), cajero: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Cajero"
    end
  end

  describe "edit cajero" do
    setup [:create_cajero]

    test "renders form for editing chosen cajero", %{conn: conn, cajero: cajero} do
      conn = get(conn, Routes.cajero_path(conn, :edit, cajero))
      assert html_response(conn, 200) =~ "Edit Cajero"
    end
  end

  describe "update cajero" do
    setup [:create_cajero]

    test "redirects when data is valid", %{conn: conn, cajero: cajero} do
      conn = put(conn, Routes.cajero_path(conn, :update, cajero), cajero: @update_attrs)
      assert redirected_to(conn) == Routes.cajero_path(conn, :show, cajero)

      conn = get(conn, Routes.cajero_path(conn, :show, cajero))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, cajero: cajero} do
      conn = put(conn, Routes.cajero_path(conn, :update, cajero), cajero: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Cajero"
    end
  end

  describe "delete cajero" do
    setup [:create_cajero]

    test "deletes chosen cajero", %{conn: conn, cajero: cajero} do
      conn = delete(conn, Routes.cajero_path(conn, :delete, cajero))
      assert redirected_to(conn) == Routes.cajero_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.cajero_path(conn, :show, cajero))
      end
    end
  end

  defp create_cajero(_) do
    cajero = fixture(:cajero)
    {:ok, cajero: cajero}
  end
end
