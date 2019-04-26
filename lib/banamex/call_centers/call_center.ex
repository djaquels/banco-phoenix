defmodule Banamex.CallCenters.CallCenter do
  use Ecto.Schema
  import Ecto.Changeset

  schema "callcenter" do
    field :Direccion, :string
    field :NoCuenta, :integer
    field :Telefono, :integer
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(call_center, attrs) do
    call_center
    |> cast(attrs, [:NoCuenta, :Direccion, :Telefono])
    |> validate_required([:NoCuenta, :Direccion, :Telefono])
  end
end
