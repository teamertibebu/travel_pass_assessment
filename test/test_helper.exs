ExUnit.start()

Mox.defmock(TravelPassAssessment.HttpClient.HttpClientMock,
  for: TravelPassAssessment.HttpClient.ClientBehaviour
)

# Application.put_env(
#   :travel_pass_code_assessment,
#   :http_client,
#   TravelPassAssessment.HttpClient.HttpClientMock
# )
