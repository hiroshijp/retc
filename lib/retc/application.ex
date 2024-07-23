defmodule Retc.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application
  require Logger

  @impl true
  def start(_type, _args) do
    # children = [
    #   # Starts a worker by calling: Retc.Worker.start_link(arg)
    #   {Retc.Worker, ["wss://host.docker.internal:4000/socket/websocket?vsn=2.0.0", "pjCCNQC"]}
    # ]

    # # See https://hexdocs.pm/elixir/Supervisor.html
    # # for other strategies and supported options
    # opts = [strategy: :one_for_one, name: Retc.Supervisor]

    # Supervisor.start_link(children, opts)
    {:ok, self()}
  end
end
