defmodule PokemonApiWeb.TrainerJSON do
  def render_many("show.json", trainers), do: Enum.map(trainers, &render("trainer.json", &1))

  def render("trainer.json", trainer) do
    %{
      "id" => trainer.id,
      "name" => trainer.name,
      "age" => trainer.age,
      "wins" => trainer.win,
      "loses" => trainer.lose
    }
  end
end
