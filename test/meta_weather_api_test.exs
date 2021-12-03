defmodule TravelPassAssessment.MetaWeatherAPITest do
  @moduledoc """
  Unit tests for the MetaWeatherAPI module.
  """
  use ExUnit.Case
  import Mox

  alias TravelPassAssessment.MetaWeatherAPI

  alias TravelPassAssessment.HttpClient.{
    HttpClientMock,
    Boise200ResponseMock,
    LosAngeles200ResponseMock,
    SaltLakeCity200ResponseMock,
    MetaWeatherErrorResponseMock
  }

  describe "get_avg_max_temps/0" do
    test "handles success responses properly. Returns list of strings w/ average max temp for given cities" do
      HttpClientMock
      |> expect(:http_mojito_get, &SaltLakeCity200ResponseMock.http_mojito_get/1)
      |> expect(:http_mojito_get, &LosAngeles200ResponseMock.http_mojito_get/1)
      |> expect(:http_mojito_get, &Boise200ResponseMock.http_mojito_get/1)

      assert [city_1, city_2, city_3] = MetaWeatherAPI.get_avg_max_temps()

      assert city_1 =~ "Salt Lake City"
      assert city_2 =~ "Los Angeles"
      assert city_3 =~ "Boise"
    end

    test "handles error responses properly." do
      expect(HttpClientMock, :http_mojito_get, 3, &MetaWeatherErrorResponseMock.http_mojito_get/1)

      assert error_response_list = MetaWeatherAPI.get_avg_max_temps()

      assert Enum.all?(error_response_list, &(&1 == "Request Could Not Be Completed")) == true
    end

    test "handles a mix of success & error responses from API" do
      HttpClientMock
      |> expect(:http_mojito_get, &MetaWeatherErrorResponseMock.http_mojito_get/1)
      |> expect(:http_mojito_get, &LosAngeles200ResponseMock.http_mojito_get/1)
      |> expect(:http_mojito_get, &Boise200ResponseMock.http_mojito_get/1)

      [error, city_1, city_2] = MetaWeatherAPI.get_avg_max_temps()

      assert error == "Request Could Not Be Completed"
      assert city_1 =~ "Los Angeles"
      assert city_2 =~ "Boise"
    end
  end
end
