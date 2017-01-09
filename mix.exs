
defmodule Miniuni.Mixfile do

  use Mix.Project

  def project do
    [app: :miniuni,
     version: "0.1.0",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application do
    [ applications: [:cowboy, :plug],
      mod: {Miniuni.Application,[]},
      extra_applications: [:logger]]
  end

  defp deps do
    [{:cowboy, "~> 1.0.0"},{:plug, "~> 1.3"}]
  end

end # === defmodule Miniuni.Mixfile
