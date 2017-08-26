defmodule Elair.Mixfile do
  use Mix.Project

  def project do
    [
      app: :elair,
      version: "1.0.0",
      elixir: "~> 1.4",
      escript: escript_config(),
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  def application do
    [extra_applications: [:logger, :httpoison]]
  end

  defp deps do
    [
      { :httpoison, "~> 0.13" },
      { :sweet_xml, "~> 0.6.5" },
      { :ex_doc, "~> 0.12" },
      { :earmark, "~> 1.0", override: true }
    ]
  end

  defp escript_config do
    [ main_module: Elair.CLI ]
  end
end
