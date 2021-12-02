defmodule TravelPassAssessment.MetaWeatherAPI do
  @moduledoc """
  This module talks to the MetaWeather API & retrieves the max temperatures over a 6-Day forecast for the given cities. get_avg_max_temps_async/0 makes concurrent requests to the MetaWeather API with the given URLs and runs the data down a pipeline to parse and map the data accordingly.
  """
  @urls [
    "https://www.metaweather.com/api/location/2487610/",
    "https://www.metaweather.com/api/location/2442047/",
    "https://www.metaweather.com/api/location/2366355/"
  ]

  def get_avg_max_temps_async() do
    @urls
    |> Task.async_stream(&HTTPoison.get/1)
    |> Enum.into([], fn {:ok, res} -> elem(res, 1) end)
    |> Enum.map(&Jason.decode!(&1.body))
    |> handle_all_responses()
  end

  defp handle_all_responses(all_responses) do
    Enum.map(all_responses, fn city_response ->
      city = city_response["title"]
      consolidated_weather = city_response["consolidated_weather"]
      avg_max_temp = calculate_avg_max_temp(consolidated_weather)

      "#{city} Average Max Temp: #{avg_max_temp}°F"
    end)
  end

  defp calculate_avg_max_temp(consolidated_weather) do
    consolidated_weather
    |> Enum.reduce(0, &(&1["max_temp"] + &2))
    |> trunc()
    |> div(length(consolidated_weather))
  end
end
