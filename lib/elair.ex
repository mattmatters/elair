defmodule Elair do
  @moduledoc """
  Elair is a small cli program for getting and displaying weather information
  for airports.
  """

  @doc """
  Main function

  ## Examples

      iex> Elair.run "KDTO"
  """
  def run(location) do
    location
    |> Elair.Weather.fetch
    |> Elair.Formatter.format
    System.halt(0)
  end
end
