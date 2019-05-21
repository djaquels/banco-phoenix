defmodule Banamex.Cuentas.Cuenta do
  use Ecto.Schema
  import Ecto.Changeset

  schema "cuentas" do
    field :no_cta, :integer
    field :saldo, :float
    field :user_id, :id 
    field :monto, :float, virtual: true

    timestamps()
  end

  @doc false
  def changeset(cuenta, attrs) do
    cuenta
    |> cast(attrs, [:saldo, :no_cta,:user_id,:monto])
    |> validate_required([:saldo, :no_cta,:user_id])
    |> retirarsaldo
  end
  def retirarsaldo(changeset) do
    monto= get_change(changeset, :monto)
    if monto <= :saldo do
      put_change(changeset, :saldo, monto)
    end
  end
end
