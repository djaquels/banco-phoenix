defmodule Banamex.Repo.Migrations.CreateCuentas do
  use Ecto.Migration

  def change do
    create table(:cuentas) do
      add :saldo, :float
      add :no_cta, :integer
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:cuentas, [:user_id])
  end
end
