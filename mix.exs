defmodule Leven.MixProject do
  use Mix.Project

  def project do
    [
      app: :leven,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:benchee, "~> 1.0", optional: true}
    ]
  end

  defp aliases do
    [
      bench: "run bench/benchmarks.exs"
    ]
  end
end
