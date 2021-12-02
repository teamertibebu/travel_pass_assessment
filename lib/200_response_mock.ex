defmodule TravelPassAssessment.HttpClient.Response200Mock do
  @behaviour TravelPassAssessment.HttpClient.ClientBehaviour

  def http_mojito_get(_url) do
    IO.inspect("blah blah blah blah")

    {:ok,
     %Mojito.Response{
       body:
         "{\"consolidated_weather\":[{\"id\":4885524369113088,\"weather_state_name\":\"Clear\",\"weather_state_abbr\":\"c\",\"wind_direction_compass\":\"NE\",\"created\":\"2021-12-02T13:58:40.549820Z\",\"applicable_date\":\"2021-12-02\",\"min_temp\":2.66,\"max_temp\":13.67,\"the_temp\":11.45,\"wind_speed\":2.2390043648187916,\"wind_direction\":41.862249463039,\"air_pressure\":1021.0,\"humidity\":70,\"visibility\":6.242605682812376,\"predictability\":68},{\"id\":5779067954528256,\"weather_state_name\":\"Heavy Cloud\",\"weather_state_abbr\":\"hc\",\"wind_direction_compass\":\"SE\",\"created\":\"2021-12-02T13:58:43.562389Z\",\"applicable_date\":\"2021-12-03\",\"min_temp\":4.09,\"max_temp\":13.52,\"the_temp\":10.95,\"wind_speed\":2.6205143674991382,\"wind_direction\":128.16390445362674,\"air_pressure\":1021.0,\"humidity\":67,\"visibility\":6.242605682812376,\"predictability\":71},{\"id\":4721454068269056,\"weather_state_name\":\"Heavy Cloud\",\"weather_state_abbr\":\"hc\",\"wind_direction_compass\":\"N\",\"created\":\"2021-12-02T13:58:46.450982Z\",\"applicable_date\":\"2021-12-04\",\"min_temp\":3.42,\"max_temp\":11.754999999999999,\"the_temp\":10.84,\"wind_speed\":3.7429964124473076,\"wind_direction\":356.3661163806724,\"air_pressure\":1018.0,\"humidity\":60,\"visibility\":9.26433379066253,\"predictability\":71},{\"id\":5699615086084096,\"weather_state_name\":\"Light Cloud\",\"weather_state_abbr\":\"lc\",\"wind_direction_compass\":\"NW\",\"created\":\"2021-12-02T13:58:49.489203Z\",\"applicable_date\":\"2021-12-05\",\"min_temp\":0.42000000000000004,\"max_temp\":6.34,\"the_temp\":5.76,\"wind_speed\":6.002980574492962,\"wind_direction\":319.6486320802113,\"air_pressure\":1030.5,\"humidity\":47,\"visibility\":14.199885170603674,\"predictability\":70},{\"id\":6459016684240896,\"weather_state_name\":\"Heavy Rain\",\"weather_state_abbr\":\"hr\",\"wind_direction_compass\":\"E\",\"created\":\"2021-12-02T13:58:52.462120Z\",\"applicable_date\":\"2021-12-06\",\"min_temp\":1.48,\"max_temp\":5.935,\"the_temp\":3.465,\"wind_speed\":5.271910928190036,\"wind_direction\":78.88361825675545,\"air_pressure\":1018.0,\"humidity\":80,\"visibility\":8.45779398313847,\"predictability\":77},{\"id\":6446051721478144,\"weather_state_name\":\"Hail\",\"weather_state_abbr\":\"h\",\"wind_direction_compass\":\"NW\",\"created\":\"2021-12-02T13:58:55.491838Z\",\"applicable_date\":\"2021-12-07\",\"min_temp\":-3.46,\"max_temp\":2.435,\"the_temp\":-0.76,\"wind_speed\":5.196639823431162,\"wind_direction\":313.5,\"air_pressure\":1020.0,\"humidity\":73,\"visibility\":8.921026206951403,\"predictability\":82}],\"time\":\"2021-12-02T08:13:31.160668-07:00\",\"sun_rise\":\"2021-12-02T07:59:41.418531-07:00\",\"sun_set\":\"2021-12-02T17:09:07.242908-07:00\",\"timezone_name\":\"LMT\",\"parent\":{\"title\":\"Idaho\",\"location_type\":\"Region / State / Province\",\"woeid\":2347571,\"latt_long\":\"45.494411,-114.143280\"},\"sources\":[{\"title\":\"BBC\",\"slug\":\"bbc\",\"url\":\"http://www.bbc.co.uk/weather/\",\"crawl_rate\":360},{\"title\":\"Forecast.io\",\"slug\":\"forecast-io\",\"url\":\"http://forecast.io/\",\"crawl_rate\":480},{\"title\":\"HAMweather\",\"slug\":\"hamweather\",\"url\":\"http://www.hamweather.com/\",\"crawl_rate\":360},{\"title\":\"Met Office\",\"slug\":\"met-office\",\"url\":\"http://www.metoffice.gov.uk/\",\"crawl_rate\":180},{\"title\":\"OpenWeatherMap\",\"slug\":\"openweathermap\",\"url\":\"http://openweathermap.org/\",\"crawl_rate\":360},{\"title\":\"Weather Underground\",\"slug\":\"wunderground\",\"url\":\"https://www.wunderground.com/?apiref=fc30dc3cd224e19b\",\"crawl_rate\":720},{\"title\":\"World Weather Online\",\"slug\":\"world-weather-online\",\"url\":\"http://www.worldweatheronline.com/\",\"crawl_rate\":360}],\"title\":\"Boise\",\"location_type\":\"City\",\"woeid\":2366355,\"latt_long\":\"43.606979,-116.193413\",\"timezone\":\"America/Boise\"}",
       status_code: 200
     }}
  end
end
