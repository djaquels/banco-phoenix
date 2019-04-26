defmodule Banamex.Repo.Migrations.CreateCajeros do
  use Ecto.Migration

  def change do
    create table(:cajeros) do
      add :saldo, :float
      add :retiro, :integer
      add :deposito, :integer

      timestamps()
    end

  end
end
