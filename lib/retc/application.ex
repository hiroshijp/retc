defmodule Retc.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application
  require Logger

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: Retc.Worker.start_link(arg)
      # {Retc.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Retc.Supervisor]

    Logger.info("Starting Retc application")
    Supervisor.start_link(children, opts)
  end
end
