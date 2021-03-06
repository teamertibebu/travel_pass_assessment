defmodule TravelPassAssessment.HttpClient.ClientBehaviour do
  @moduledoc """
  This module sets up the behaviour for 'http_client'. The 'http_client' values differ for the dev & test environments.
  The value is supplied by placing:
  @http_client Application.get_env(:travel_pass_assessment, :http_client, TravelPassAssessment.HttpClient.Client)
  at the top of the file.
  """

  @callback http_mojito_get(url :: String.t()) ::
              {:ok, response :: map} | {:error, response :: map}
end
