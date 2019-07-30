class DailyForecastService

  def get_five_day_forecast(location)
    lcs = LocationCoordinatesService.new
    coords = lcs.get_coordinates(location)
    lat = coords[:lat]
    long = coords[:lng]

    dark_sky_response = Faraday.get "https://api.darksky.net/forecast/#{ENV['DARK_SKY_SECRET_KEY']}/#{lat},#{long}"
    full_daily_forecast = JSON.parse(dark_sky_response.body, symbolize_names: true)[:daily][:data]
    five_days = full_daily_forecast[0..4].map do |day|
      DailyForecastSummary.new(day)
    end
  end
end

# circle back to refactor connection to dark sky api to it's own private method
# so that this could be used to get different forecasts i.e. 3 day, 7 day, 12 hrs, etc
