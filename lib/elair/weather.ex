defmodule Elair.Weather do
  import SweetXml
  @user_agent [ {"User-agent", "Elixir domattthings@gmail.com"} ]
  @weather_url Application.get_env(:elair, :weather_url)

  @doc """
  Wrapper for the weather ajax request,
  Takes a valid airport id and returns a map of data
  """
  def fetch(location) do
    weather_url(location)
    |> HTTPoison.get(@user_agent)
    |> handle_response
  end

  def weather_url(location), do: @weather_url<>location<>".xml"


  @doc """
  Parses a successful xml response
  """
  def handle_response({ :ok, %{status_code: 200, body: body} }) do
    body
    |> xmap([
      id: ~x"//station_id/text()",
      location: ~x"//location/text()",
      weather: ~x"//weather/text()",
      temperature: ~x"//temperature_string/text()",
      wind: ~x"//wind_string/text()",
      pickup: ~x"//suggested_pickup/text()",
      obs_time: ~x"//observation_time_rfc822/text()"
    ])
  end

  @doc """
  If the response returns an error, print it and exit
  """
  def handle_response({ _, %{status_code: _, body: body} }) do
    IO.puts("error: #{body}")
    System.halt(2)
  end
end
