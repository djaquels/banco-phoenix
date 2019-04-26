defmodule BanamexWeb.CuentaControllerTest do
  use BanamexWeb.ConnCase

  alias Banamex.Cuentas

  @create_attrs %{no_cta: 42, saldo: 120.5}
  @update_attrs %{no_cta: 43, saldo: 456.7}
  @invalid_attrs %{no_cta: nil, saldo: nil}

  def fixture(:cuenta) do
    {:ok, cuenta} = Cuentas.create_cuenta(@create_attrs)
    cuenta
  end

  describe "index" do
    test "lists all cuentas", %{conn: conn} do
      conn = get(conn, Routes.cuenta_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Cuentas"
    end
  end

  describe "new cuenta" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.cuenta_path(conn, :new))
      assert html_response(conn, 200) =~ "New Cuenta"
    end
  end

  describe "create cuenta" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.cuenta_path(conn, :create), cuenta: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.cuenta_path(conn, :show, id)

      conn = get(conn, Routes.cuenta_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Cuenta"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.cuenta_path(conn, :create), cuenta: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Cuenta"
    end
  end

  describe "edit cuenta" do
    setup [:create_cuenta]

    test "renders form for editing chosen cuenta", %{conn: conn, cuenta: cuenta} do
      conn = get(conn, Routes.cuenta_path(conn, :edit, cuenta))
      assert html_response(conn, 200) =~ "Edit Cuenta"
    end
  end

  describe "update cuenta" do
    setup [:create_cuenta]

    test "redirects when data is valid", %{conn: conn, cuenta: cuenta} do
      conn = put(conn, Routes.cuenta_path(conn, :update, cuenta), cuenta: @update_attrs)
      assert redirected_to(conn) == Routes.cuenta_path(conn, :show, cuenta)

      conn = get(conn, Routes.cuenta_path(conn, :show, cuenta))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, cuenta: cuenta} do
      conn = put(conn, Routes.cuenta_path(conn, :update, cuenta), cuenta: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Cuenta"
    end
  end

  describe "delete cuenta" do
    setup [:create_cuenta]

    test "deletes chosen cuenta", %{conn: conn, cuenta: cuenta} do
      conn = delete(conn, Routes.cuenta_path(conn, :delete, cuenta))
      assert redirected_to(conn) == Routes.cuenta_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.cuenta_path(conn, :show, cuenta))
      end
    end
  end

  defp create_cuenta(_) do
    cuenta = fixture(:cuenta)
    {:ok, cuenta: cuenta}
  end
end
