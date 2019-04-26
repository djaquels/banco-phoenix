defmodule Banamex.Cajeros.Cajero do
  use Ecto.Schema
  import Ecto.Changeset

  schema "cajeros" do
    field :deposito, :integer
    field :retiro, :integer
    field :saldo, :float

    timestamps()
  end

  @doc false
  def changeset(cajero, attrs) do
    cajero
    |> cast(attrs, [:saldo, :retiro, :deposito])
    |> validate_required([:saldo, :retiro, :deposito])
  end
end
