defmodule TravelPassAssessment.HttpClient.MetaWeatherErrorResponseMock do
  @moduledoc """
  This supplies mock MetaWeather API responses via Mox.
  This GET request is specifically returning an error response.
  """

  @behaviour TravelPassAssessment.HttpClient.ClientBehaviour

  def http_mojito_get(_url) do
    {:error, %Mojito.Error{message: nil, reason: nil}}
  end
end
