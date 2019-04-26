defmodule Banamex.CuentasTest do
  use Banamex.DataCase

  alias Banamex.Cuentas

  describe "cuentas" do
    alias Banamex.Cuentas.Cuenta

    @valid_attrs %{no_cta: 42, saldo: 120.5}
    @update_attrs %{no_cta: 43, saldo: 456.7}
    @invalid_attrs %{no_cta: nil, saldo: nil}

    def cuenta_fixture(attrs \\ %{}) do
      {:ok, cuenta} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Cuentas.create_cuenta()

      cuenta
    end

    test "list_cuentas/0 returns all cuentas" do
      cuenta = cuenta_fixture()
      assert Cuentas.list_cuentas() == [cuenta]
    end

    test "get_cuenta!/1 returns the cuenta with given id" do
      cuenta = cuenta_fixture()
      assert Cuentas.get_cuenta!(cuenta.id) == cuenta
    end

    test "create_cuenta/1 with valid data creates a cuenta" do
      assert {:ok, %Cuenta{} = cuenta} = Cuentas.create_cuenta(@valid_attrs)
      assert cuenta.no_cta == 42
      assert cuenta.saldo == 120.5
    end

    test "create_cuenta/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Cuentas.create_cuenta(@invalid_attrs)
    end

    test "update_cuenta/2 with valid data updates the cuenta" do
      cuenta = cuenta_fixture()
      assert {:ok, %Cuenta{} = cuenta} = Cuentas.update_cuenta(cuenta, @update_attrs)
      assert cuenta.no_cta == 43
      assert cuenta.saldo == 456.7
    end

    test "update_cuenta/2 with invalid data returns error changeset" do
      cuenta = cuenta_fixture()
      assert {:error, %Ecto.Changeset{}} = Cuentas.update_cuenta(cuenta, @invalid_attrs)
      assert cuenta == Cuentas.get_cuenta!(cuenta.id)
    end

    test "delete_cuenta/1 deletes the cuenta" do
      cuenta = cuenta_fixture()
      assert {:ok, %Cuenta{}} = Cuentas.delete_cuenta(cuenta)
      assert_raise Ecto.NoResultsError, fn -> Cuentas.get_cuenta!(cuenta.id) end
    end

    test "change_cuenta/1 returns a cuenta changeset" do
      cuenta = cuenta_fixture()
      assert %Ecto.Changeset{} = Cuentas.change_cuenta(cuenta)
    end
  end
end
