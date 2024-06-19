defmodule PokemonApi.Trainers do
  @moduledoc"""
    Context for trainers
  """

  alias PokemonApi.Repo
  alias PokemonApi.Trainer

  def list_trainers do
    Repo.all(Trainer)
  end

  def get_trainer!(id) do
    Repo.get!(Trainer, id)
  end

  def create_trainer(attrs \\%{}) do
    %Trainer{}
      |> Trainer.changeset(attrs)
      |> Repo.insert()
  end

  def delete_trainer(%Trainer{} = trainer) do
    Repo.delete(trainer)
  end

end
