defmodule TravelPassAssessment.MetaWeatherAPITest do
  use ExUnit.Case
  alias TravelPassAssessment.MetaWeatherAPI

  test "" do
    IO.inspect(MetaWeatherAPI.get_avg_max_temps_async())
  end
end
