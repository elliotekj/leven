defmodule Leven.MixProject do
  use Mix.Project

  @version "1.0.0"
  @repo_url "https://github.com/elliotekj/leven"

  def project do
    [
      app: :leven,
      version: @version,
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases(),
      package: package(),
      description: description(),
      docs: docs()
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
      {:benchee, "~> 1.0", optional: true},
      {:ex_doc, "~> 0.27", only: :dev, runtime: false}
    ]
  end

  defp aliases do
    [
      bench: "run bench/benchmarks.exs"
    ]
  end

  defp package do
    [
      maintainers: ["Elliot Jackson"],
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => @repo_url}
    ]
  end

  defp description do
    """
    An efficient, tabulated implementation of the Levenshtein distance algorithm
    used to compute the edit distance between two strings.
    """
  end

  defp docs do
    [
      name: "Leven",
      source_ref: "v#{@version}",
      canonical: "http://hexdocs.pm/leven",
      source_url: @repo_url,
      extras: ["README.md"]
    ]
  end
end
