defmodule Banamex.CajerosTest do
  use Banamex.DataCase

  alias Banamex.Cajeros

  describe "cajeros" do
    alias Banamex.Cajeros.Cajero

    @valid_attrs %{deposito: 42, retiro: 42, saldo: 120.5}
    @update_attrs %{deposito: 43, retiro: 43, saldo: 456.7}
    @invalid_attrs %{deposito: nil, retiro: nil, saldo: nil}

    def cajero_fixture(attrs \\ %{}) do
      {:ok, cajero} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Cajeros.create_cajero()

      cajero
    end

    test "list_cajeros/0 returns all cajeros" do
      cajero = cajero_fixture()
      assert Cajeros.list_cajeros() == [cajero]
    end

    test "get_cajero!/1 returns the cajero with given id" do
      cajero = cajero_fixture()
      assert Cajeros.get_cajero!(cajero.id) == cajero
    end

    test "create_cajero/1 with valid data creates a cajero" do
      assert {:ok, %Cajero{} = cajero} = Cajeros.create_cajero(@valid_attrs)
      assert cajero.deposito == 42
      assert cajero.retiro == 42
      assert cajero.saldo == 120.5
    end

    test "create_cajero/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Cajeros.create_cajero(@invalid_attrs)
    end

    test "update_cajero/2 with valid data updates the cajero" do
      cajero = cajero_fixture()
      assert {:ok, %Cajero{} = cajero} = Cajeros.update_cajero(cajero, @update_attrs)
      assert cajero.deposito == 43
      assert cajero.retiro == 43
      assert cajero.saldo == 456.7
    end

    test "update_cajero/2 with invalid data returns error changeset" do
      cajero = cajero_fixture()
      assert {:error, %Ecto.Changeset{}} = Cajeros.update_cajero(cajero, @invalid_attrs)
      assert cajero == Cajeros.get_cajero!(cajero.id)
    end

    test "delete_cajero/1 deletes the cajero" do
      cajero = cajero_fixture()
      assert {:ok, %Cajero{}} = Cajeros.delete_cajero(cajero)
      assert_raise Ecto.NoResultsError, fn -> Cajeros.get_cajero!(cajero.id) end
    end

    test "change_cajero/1 returns a cajero changeset" do
      cajero = cajero_fixture()
      assert %Ecto.Changeset{} = Cajeros.change_cajero(cajero)
    end
  end
end
