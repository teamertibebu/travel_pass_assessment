defmodule TravelPassAssessment.MetaWeatherAPI do
  @moduledoc """
  This module talks to the MetaWeather API & retrieves the max temperatures over a 6-Day forecast for the given cities. get_avg_max_temps/0 makes concurrent requests to the MetaWeather API with the given URLs and runs the responses down a pipeline to parse & map the data accordingly.
  """

  # this sets up a dynamic value for 'http_client', the values are determined by what environment you are running i.e. dev/test.
  # This allows for mock API calls set up with Mox
  def http_client() do
    Application.get_env(
      :travel_pass_code_assessment,
      :http_client,
      TravelPassAssessment.HttpClient.Client
    )
  end

  @urls [
    "https://www.metaweather.com/api/location/2487610/",
    "https://www.metaweather.com/api/location/2442047/",
    "https://www.metaweather.com/api/location/2366355/"
  ]

  def get_avg_max_temps() do
    @urls
    |> Task.async_stream(&http_client().http_mojito_get/1)
    |> Enum.into([], fn {:ok, res} -> res end)
    |> Enum.map(&handle_response(&1))
  end

  defp handle_response({:ok, response_data}) do
    response_data = Jason.decode!(response_data.body)

    city = response_data["title"]
    consolidated_weather = response_data["consolidated_weather"]
    avg_max_temp = calculate_avg_max_temp(consolidated_weather)

    "#{city} Average Max Temp: #{avg_max_temp}°C"
  end

  defp handle_response({:error, _}), do: "Request Could Not Be Completed"

  defp calculate_avg_max_temp(consolidated_weather) do
    consolidated_weather
    |> Enum.reduce(0, &(&1["max_temp"] + &2))
    |> trunc()
    |> div(length(consolidated_weather))
  end
end
