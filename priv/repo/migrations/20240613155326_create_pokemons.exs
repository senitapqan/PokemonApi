defmodule PokemonApi.Repo.Migrations.CreatePokemons do
  use Ecto.Migration

  def change do
    create table(:pokemons) do
      add :name, :string
      add :type, :string
      add :level, :integer

      timestamps(type: :utc_datetime)
    end
  end
end
