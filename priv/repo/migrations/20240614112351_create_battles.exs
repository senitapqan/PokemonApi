defmodule PokemonApi.Repo.Migrations.CreateBattles do
  use Ecto.Migration

  def change do
    create table(:battles) do
      add :trainer1_id, references(:trainers, on_delete: :nothing)
      add :trainer2_id, references(:trainers, on_delete: :nothing)
      add :winner_id, references(:trainers, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:battles, [:trainer1_id])
    create index(:battles, [:trainer2_id])
    create index(:battles, [:winner_id])
  end
end
