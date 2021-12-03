defmodule TravelPassAssessment.HttpClient.Client do
  @moduledoc """
  This module supplies the 'true' value of 'http_client' when making API calls.
  It will use a real http client (ex. Mojito) and reach out to the 'true' API (ex. MetaWeather)
  resulting in a 'true' API response instead of producing a 'mock' API response(which is used for testing).
  Any functions created here must exist as a @callback in the client_behaviour.ex file
  and follow the behaviour there.
  """

  @behaviour TravelPassAssessment.HttpClient.ClientBehaviour

  def http_mojito_get(url) do
    Mojito.get(url)
  end
end
