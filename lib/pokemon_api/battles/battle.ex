defmodule PokemonApi.Battle do
  use Ecto.Schema
  import Ecto.Changeset

  schema "battles" do

    field :trainer1_id, :id
    field :trainer2_id, :id
    field :winner_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(battle, attrs) do
    battle
    |> cast(attrs, [])
    |> validate_required([])
  end
end
