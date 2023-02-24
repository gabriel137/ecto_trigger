defmodule PhoenixDefault.Repo.Migrations.CreateFinanciamentosTable do
  use Ecto.Migration

  def change do
    create table("financiamentos") do
      add :etapa, :string
      add :status, :string
    end
  end
end
