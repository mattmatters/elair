defmodule Elair.Formatter do
  @doc """
  Prints data in a readable format
  """
  def format(data) do
    IO.puts("""
    #{data.id} ---- #{data.location}

        Current Weather: #{data.weather}
        Temperature:     #{data.temperature}
        Wind:            #{data.wind}

    Last updated on #{data.obs_time}
    """)
  end
end
