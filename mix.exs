defmodule Absinthe.Plug.Mixfile do
  use Mix.Project

  @version "1.4.0-beta.2"

  def project do
    [app: :absinthe_plug,
     version: @version,
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     elixirc_paths: elixirc_paths(Mix.env),
     package: package(),
     docs: [source_ref: "v#{@version}", main: "Absinthe.Plug"],
     deps: deps()]
  end

  defp package do
    [description: "Plug support for Absinthe, the GraphQL toolkit for Elixir",
     files: ["lib", "mix.exs", "README*"],
     maintainers: ["Ben Wilson", "Bruce Williams"],
     licenses: ["BSD"],
     links: %{
       site: "http://absinthe-graphql.org",
       github: "https://github.com/absinthe-graphql/absinthe_plug",
      }
    ]
  end

  def application do
    [applications: [:logger, :plug, :absinthe]]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]

  defp deps do
    [
      {:plug, "~> 1.3.2 or ~> 1.4"},
      {:absinthe, "~> 1.4.0-beta"},
      {:poison, ">= 0.0.0", only: [:dev, :test]},
      {:ex_doc, "~> 0.14.0", only: :dev},
      {:earmark, "~> 1.1.0", only: :dev},
    ]
  end
end
