defmodule TravelPassAssessment.Mocks do
  @moduledoc """
  A module for creating mock API requests with Mox
  """
  Mox.defmock(TravelPassAssessment.HttpClient.HttpClientMock,
    for: TravelPassAssessment.HttpClient.ClientBehaviour
  )
end
