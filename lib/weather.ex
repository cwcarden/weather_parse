defmodule Weather do

  @doc """
  Fetches current weather data and checks probability of rain and rain intensity.
  """

  def get_current() do
    longitude = "35.2091"
    lattitude = "-101.8890"
    api_key = ""
    url = "https://api.darksky.net/forecast/#{api_key}/#{longitude},#{lattitude}
    ?exclude=minutely,current,daily,flags"
    data = Poison.decode!(HTTPoison.get!(url).body)
    data["currently"]
    #Map.fetch(data, "currently")
  end

@doc """
Fetches weather data at 6 hours and 10 hours in future.
For sprinkler activation, boolean is used for "probability of rain in api"
"""
def get_forecast() do
  longitude = "35.2091"
  lattitude = "-101.8890"
  api_key = ""
  url = "https://api.darksky.net/forecast/#{api_key}/#{longitude},#{lattitude}"
  data = Poison.decode!(HTTPoison.get!(url).body)
  six_hr_forecast = Enum.at(data["hourly"]["data"], 7)
  ten_hr_forecast = Enum.at(data["hourly"]["data"], 11)
end


@doc """
Fetches weather data based on 12 hours prior to current unix time.
"""
def get_history() do
  longitude = "35.2091"
  lattitude = "-101.8890"
  api_key = ""
  current_time = DateTime.to_unix(DateTime.utc_now)
  hist_time = current_time - (div((24*60*60), 2))
  url = "https://api.darksky.net/forecast/#{api_key}/#{longitude},#{lattitude},#{hist_time}?exclude=current,flags"
  data = Poison.decode!(HTTPoison.get!(url).body)
  data["currently"]
end

end
