defmodule Banamex.Repo.Migrations.AddTelefonoToUsers do
  use Ecto.Migration

  def change do
    alter table("users") do
      add :telefono, :text
    end
  end
end
