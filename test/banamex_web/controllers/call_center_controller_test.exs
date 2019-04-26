defmodule BanamexWeb.CallCenterControllerTest do
  use BanamexWeb.ConnCase

  alias Banamex.CallCenters

  @create_attrs %{Direccion: "some Direccion", NoCuenta: 42, Telefono: 42}
  @update_attrs %{Direccion: "some updated Direccion", NoCuenta: 43, Telefono: 43}
  @invalid_attrs %{Direccion: nil, NoCuenta: nil, Telefono: nil}

  def fixture(:call_center) do
    {:ok, call_center} = CallCenters.create_call_center(@create_attrs)
    call_center
  end

  describe "index" do
    test "lists all callcenter", %{conn: conn} do
      conn = get(conn, Routes.call_center_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Callcenter"
    end
  end

  describe "new call_center" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.call_center_path(conn, :new))
      assert html_response(conn, 200) =~ "New Call center"
    end
  end

  describe "create call_center" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.call_center_path(conn, :create), call_center: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.call_center_path(conn, :show, id)

      conn = get(conn, Routes.call_center_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Call center"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.call_center_path(conn, :create), call_center: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Call center"
    end
  end

  describe "edit call_center" do
    setup [:create_call_center]

    test "renders form for editing chosen call_center", %{conn: conn, call_center: call_center} do
      conn = get(conn, Routes.call_center_path(conn, :edit, call_center))
      assert html_response(conn, 200) =~ "Edit Call center"
    end
  end

  describe "update call_center" do
    setup [:create_call_center]

    test "redirects when data is valid", %{conn: conn, call_center: call_center} do
      conn = put(conn, Routes.call_center_path(conn, :update, call_center), call_center: @update_attrs)
      assert redirected_to(conn) == Routes.call_center_path(conn, :show, call_center)

      conn = get(conn, Routes.call_center_path(conn, :show, call_center))
      assert html_response(conn, 200) =~ "some updated Direccion"
    end

    test "renders errors when data is invalid", %{conn: conn, call_center: call_center} do
      conn = put(conn, Routes.call_center_path(conn, :update, call_center), call_center: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Call center"
    end
  end

  describe "delete call_center" do
    setup [:create_call_center]

    test "deletes chosen call_center", %{conn: conn, call_center: call_center} do
      conn = delete(conn, Routes.call_center_path(conn, :delete, call_center))
      assert redirected_to(conn) == Routes.call_center_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.call_center_path(conn, :show, call_center))
      end
    end
  end

  defp create_call_center(_) do
    call_center = fixture(:call_center)
    {:ok, call_center: call_center}
  end
end
