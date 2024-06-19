defmodule PokemonApi.Trainer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "trainers" do
    field :name, :string
    field :age, :integer
    field :win, :integer
    field :lose, :integer
    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(trainer, attrs) do
    trainer
    |> cast(attrs, [:name, :age, :win, :lose])
    |> validate_required([:name, :age])
  end
end
