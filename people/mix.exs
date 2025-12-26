defmodule People.MixProject do
  use Mix.Project

  def project do
    [
      app: :people,
      version: "0.1.0",
      elixir: "~> 1.17",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  # $ mix deps.get (to download these dependencies)
  # $ mix deps.tree (to see dependency tree)
  defp deps do
    [
      {:plug_cowboy, "2.4.1"} # package, version
    ]
  end
end
