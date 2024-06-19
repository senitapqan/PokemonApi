defmodule PokemonApi.Repo.Migrations.CreateTrainers do
  use Ecto.Migration

  def change do
    create table(:trainers) do
      add :name, :string
      add :age, :integer
      add :win, :integer
      add :lose, :integer
      timestamps(type: :utc_datetime)
    end
  end
end
