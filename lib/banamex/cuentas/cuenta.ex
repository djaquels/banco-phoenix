defmodule Banamex.Cuentas.Cuenta do
  use Ecto.Schema
  import Ecto.Changeset

  schema "cuentas" do
    field :no_cta, :integer
    field :saldo, :float
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(cuenta, attrs) do
    cuenta
    |> cast(attrs, [:saldo, :no_cta])
    |> validate_required([:saldo, :no_cta])
  end
end
