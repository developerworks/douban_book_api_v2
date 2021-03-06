defmodule DoubanBookApiV2.Mixfile do
  use Mix.Project

  def project do
    [app: :douban_book_api_v2,
     version: "0.0.1",
     elixir: "~> 1.0",
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type `mix help deps` for more examples and options
  defp deps do
    [
      {:ibrowse, github: "cmullaparthi/ibrowse", tag: "v4.1.0"},
      {:jiffy, github: "davisp/jiffy"},
      # {:jsx, github: "talentdeficit/jsx"},
      {:httpotion, "~> 0.2.0"},
      {:ej, github: "seth/ej"},
      {:fsm, github: "sasa1977/fsm"}
      # ,{:json, github: "cblage/elixir-json"}
    ]
  end
end
