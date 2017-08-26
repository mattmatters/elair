defmodule Elair.CLI do
  def main(argv) do
    argv
    |> parse_args
    |> process
  end

  def parse_args(argv) do
    parse = OptionParser.parse(argv, switches: [ help: :boolean ], aliases: [ h: :help ])
    case parse do
      { [ help: true ], _, _ }
        -> :help
      { _, [ location ], _ }
        -> location
      _ -> :help
    end
  end

  def process(:help) do
    IO.puts("Usage: elair <location>")
    System.halt(2)
  end

  def process(location) do
    Elair.run(location)
  end
end
