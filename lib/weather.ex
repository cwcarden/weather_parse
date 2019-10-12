defmodule Weather do
  def get_local do
    api_key = ""
    app_key = ""
    data = Map.fetch(List.first(Poison.decode!(HTTPoison.get!("https://api.ambientweather.net/v1/devices?applicationKey=#{app_key}&apiKey=#{api_key}").body)), "lastData")
    data = elem(data, 1)
  end

def get_forecast do
  longitude = "34.2091"
  lattitude = "-105.8890"
  api_key = ""
  url = "https://api.darksky.net/forecast/#{api_key}/#{longitude},#{lattitude}?exclude=minutely,current,daily,flags"
  data = Poison.decode!(HTTPoison.get!(url).body)

  end

end
