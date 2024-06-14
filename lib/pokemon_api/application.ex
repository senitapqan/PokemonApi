defmodule PokemonApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      PokemonApiWeb.Telemetry,
      PokemonApi.Repo,
      {DNSCluster, query: Application.get_env(:pokemon_api, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: PokemonApi.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: PokemonApi.Finch},
      # Start a worker by calling: PokemonApi.Worker.start_link(arg)
      # {PokemonApi.Worker, arg},
      # Start to serve requests, typically the last entry
      PokemonApiWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PokemonApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PokemonApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
