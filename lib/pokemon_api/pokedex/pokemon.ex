defmodule PokemonApi.Pokedex.Pokemon do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pokemons" do
    field :name, :string
    field :type, :string
    field :level, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(pokemon, attrs) do
    pokemon
    |> cast(attrs, [:name, :type, :level])
    |> validate_required([:name, :type, :level])
  end
end
