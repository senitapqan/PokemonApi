defmodule PokemonApiWeb.PokemonController do
  use PokemonApiWeb, :controller

  require Logger

  alias PokemonApi.Pokedex
  alias PokemonApiWeb.PokemonJSON

  def index(conn, _params) do
    Logger.info("Sended request to context: get all pokemons")
    pokemons = Pokedex.list_pokemons()
    json(conn, %{data: PokemonJSON.render_many("show.json", pokemons)})
  end

  def show(conn, _params) do

  end

  def create(conn, _params) do

  end

  def update(conn, _params) do

  end

  def delete(conn, _params) do

  end

end
