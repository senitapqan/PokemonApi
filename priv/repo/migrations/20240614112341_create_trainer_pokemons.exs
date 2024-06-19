defmodule PokemonApi.Repo.Migrations.CreateTrainerPokemons do
  use Ecto.Migration

  def change do
    create table(:trainer_pokemons) do
      add :trainer_id, references(:trainers, on_delete: :nothing)
      add :pokemon_id, references(:pokemons, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:trainer_pokemons, [:trainer_id])
    create index(:trainer_pokemons, [:pokemon_id])
  end
end
