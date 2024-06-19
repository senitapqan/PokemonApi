defmodule PokemonApiWeb.PokemonJSON do
  def render_many("show.json", pokemons), do: Enum.map(pokemons, &render("pokemon.json", &1))

  def render("pokemon.json", pokemon) do
    %{
      "id" => pokemon.id,
      "name" => pokemon.name,
      "type" => pokemon.type,
      "level" => pokemon.level
    }
  end
end
