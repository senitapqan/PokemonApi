defmodule PokemonApi.TrainerPokemon do
  use Ecto.Schema
  import Ecto.Changeset

  schema "trainer_pokemons" do

    field :trainer_id, :id
    field :pokemon_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(trainer_pokemon, attrs) do
    trainer_pokemon
    |> cast(attrs, [])
    |> validate_required([])
  end
end
