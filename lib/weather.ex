defmodule Weather do
  def get_local do
    api_key = ""
    app_key = ""
    data = Map.fetch(List.first(Poison.decode!(HTTPoison.get!("https://api.ambientweather.net/v1/devices?applicationKey=#{app_key}&apiKey=#{api_key}").body)), "lastData")
    data = elem(data, 1)
    last_rain = Map.fetch(data, "lastRain")
    is_raining = Map.fetch(data, "eventrainin")
    current_temp = Map.fetch(data, "tempf")
    local_data = {last_rain, is_raining, current_temp}
  end

def get_forecast do
  longitude = "35.2091"
  lattitude = "-101.8890"
  api_key = ""
  url = "https://api.darksky.net/forecast/#{api_key}/#{longitude},#{lattitude}?exclude=minutely,current,daily,flags"
  data = Poison.decode!(HTTPoison.get!(url).body)
  Map.fetch(data, "currently")
  end

end
