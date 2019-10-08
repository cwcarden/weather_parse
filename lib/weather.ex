defmodule Weather do
  def get_weather_map() do
    api_key = "insert_api_key"
    app_key = "insert app key"
    Poison.decode!(HTTPoison.get!("https://api.ambientweather.net/v1/devices?applicationKey=#{app_key}&apiKey=#{api_key}").body)
  end
end
