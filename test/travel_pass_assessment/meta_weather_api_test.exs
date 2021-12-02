defmodule TravelPassAssessment.MetaWeatherAPITest do
  use ExUnit.Case

  alias TravelPassAssessment.{
    MetaWeatherAPI,
    HttpClient.Response200Mock,
    HttpClient.HttpClientMock
  }

  test "" do
    Mox.stub_with(HttpClientMock, Response200Mock)
    IO.inspect(MetaWeatherAPI.get_avg_max_temps_async())
  end
end
