defmodule Banamex.Repo.Migrations.CreateCallcenter do
  use Ecto.Migration

  def change do
    create table(:callcenter) do
      add :NoCuenta, :integer
      add :Direccion, :string
      add :Telefono, :integer
      add :user_id, references(:posts, on_delete: :nothing)

      timestamps()
    end

    create index(:callcenter, [:user_id])
  end
end
