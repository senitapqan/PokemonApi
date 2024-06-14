defmodule PokemonApiWeb.PokemonController do
  use PokemonApiWeb, :controller

  def getPokemons(conn, _params) do
    json(conn, %{data: "test passed"})
  end

end
