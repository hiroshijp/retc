defmodule Retc.MixProject do
  use Mix.Project

  def project do
    [
      app: :retc,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Retc.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:phoenix_client, "~> 0.3"},
      {:jason, "~> 1.0"}
    ]
  end
end
