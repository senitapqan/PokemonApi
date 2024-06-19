defmodule PokemonApi.Pokedex do
  @moduledoc """
  The Pokedex context.
  """

  import Ecto.Query, warn: false
  alias PokemonApi.Repo

  alias PokemonApi.Pokedex.Pokemon

  @doc "Returns the list of pokemons."
  def list_pokemons do
    Repo.all(Pokemon)
  end

  @doc "Gets a single pokemon."
  def get_pokemon!(id), do: Repo.get!(Pokemon, id)

  @doc "Creates a pokemon"
  def create_pokemon(attrs \\ %{}) do
    %Pokemon{}
    |> Pokemon.changeset(attrs)
    |> Repo.insert()
  end

  @doc "Updates a pokemon."
  def update_pokemon(%Pokemon{} = pokemon, attrs) do
    pokemon
    |> Pokemon.changeset(attrs)
    |> Repo.update()
  end

  @doc "Deletes a pokemon."
  def delete_pokemon(%Pokemon{} = pokemon) do
    Repo.delete(pokemon)
  end

  @doc "Returns an `%Ecto.Changeset{}` for tracking pokemon changes."
  def change_pokemon(%Pokemon{} = pokemon, attrs \\ %{}) do
    Pokemon.changeset(pokemon, attrs)
  end
end
