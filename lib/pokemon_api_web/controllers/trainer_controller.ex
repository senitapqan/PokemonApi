defmodule PokemonApiWeb.TrainerController do
  use PokemonApiWeb, :controller

  alias PokemonApi.Trainers
  alias PokemonApiWeb.TrainerJSON

  require Logger

  def index(conn, _params) do
    Logger.info("Sended request to context: get all trainers")
    trainers = Trainers.list_trainers()
    json(conn, %{data: TrainerJSON.render_many("show.json", trainers)})
  end

  def show(conn, %{"id" => id}) do
    Logger.info("Sended request to context: get trainer by id -> #{id}")
    trainer = Trainers.get_trainer!(id)
    json(conn, %{data: TrainerJSON.render("trainer.json", trainer)})
  end

  def create(conn, trainer_params) do
    Logger.info("Sended request to context: create trainer")
    case Trainers.create_trainer(trainer_params) do
      {:ok, trainer} ->
        conn
        |> put_status(:created)
        |> json(%{data: TrainerJSON.render("trainer.json", trainer)})

      {:error, %Ecto.Changeset{} = changeset} ->
        dbg(changeset)
        conn
        |> put_status(:unprocessable_entity)
        |> json(%{data: changeset})
    end
  end

end
