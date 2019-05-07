defmodule Banamex.Repo.Migrations.AddTipoToUsers do
  use Ecto.Migration

  def change do
    alter table("users") do
      add :tipo, :integer
    end
  end

end
