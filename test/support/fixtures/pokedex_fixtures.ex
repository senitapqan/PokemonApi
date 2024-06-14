defmodule PokemonApi.PokedexFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PokemonApi.Pokedex` context.
  """

  @doc """
  Generate a pokemon.
  """
  def pokemon_fixture(attrs \\ %{}) do
    {:ok, pokemon} =
      attrs
      |> Enum.into(%{
        level: 42,
        name: "some name",
        type: "some type"
      })
      |> PokemonApi.Pokedex.create_pokemon()

    pokemon
  end
end
