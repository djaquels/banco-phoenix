defmodule Banamex.CallCentersTest do
  use Banamex.DataCase

  alias Banamex.CallCenters

  describe "callcenter" do
    alias Banamex.CallCenters.CallCenter

    @valid_attrs %{Direccion: "some Direccion", NoCuenta: 42, Telefono: 42}
    @update_attrs %{Direccion: "some updated Direccion", NoCuenta: 43, Telefono: 43}
    @invalid_attrs %{Direccion: nil, NoCuenta: nil, Telefono: nil}

    def call_center_fixture(attrs \\ %{}) do
      {:ok, call_center} =
        attrs
        |> Enum.into(@valid_attrs)
        |> CallCenters.create_call_center()

      call_center
    end

    test "list_callcenter/0 returns all callcenter" do
      call_center = call_center_fixture()
      assert CallCenters.list_callcenter() == [call_center]
    end

    test "get_call_center!/1 returns the call_center with given id" do
      call_center = call_center_fixture()
      assert CallCenters.get_call_center!(call_center.id) == call_center
    end

    test "create_call_center/1 with valid data creates a call_center" do
      assert {:ok, %CallCenter{} = call_center} = CallCenters.create_call_center(@valid_attrs)
      assert call_center.Direccion == "some Direccion"
      assert call_center.NoCuenta == 42
      assert call_center.Telefono == 42
    end

    test "create_call_center/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = CallCenters.create_call_center(@invalid_attrs)
    end

    test "update_call_center/2 with valid data updates the call_center" do
      call_center = call_center_fixture()
      assert {:ok, %CallCenter{} = call_center} = CallCenters.update_call_center(call_center, @update_attrs)
      assert call_center.Direccion == "some updated Direccion"
      assert call_center.NoCuenta == 43
      assert call_center.Telefono == 43
    end

    test "update_call_center/2 with invalid data returns error changeset" do
      call_center = call_center_fixture()
      assert {:error, %Ecto.Changeset{}} = CallCenters.update_call_center(call_center, @invalid_attrs)
      assert call_center == CallCenters.get_call_center!(call_center.id)
    end

    test "delete_call_center/1 deletes the call_center" do
      call_center = call_center_fixture()
      assert {:ok, %CallCenter{}} = CallCenters.delete_call_center(call_center)
      assert_raise Ecto.NoResultsError, fn -> CallCenters.get_call_center!(call_center.id) end
    end

    test "change_call_center/1 returns a call_center changeset" do
      call_center = call_center_fixture()
      assert %Ecto.Changeset{} = CallCenters.change_call_center(call_center)
    end
  end
end
