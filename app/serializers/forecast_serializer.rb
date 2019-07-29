# coding: utf-8

class ForecastSerializer
  def initialize(forecast, citystate, country)
    @forecast = forecast
    @city_state = citystate
    @country = country
  end

  def all_details
    {
      "currently" => {
                     "summary" => "#{@forecast[:currently][:summary]}",
                     "temperature" => "#{formatted_temp(@forecast[:currently][:temperature])}°",
                     "time_and_date" => formatted_date_time,
                     "high" => "High: #{formatted_temp(@forecast[:daily][:data][0][:temperatureHigh])}°",
                     "low" => "Low: #{formatted_temp(@forecast[:daily][:data][0][:temperatureLow])}°",
                     "location" => formatted_location,
                     "country" => "#{@country}"
      },
      "details" => {
                    "icon" => "#{@forecast[:daily][:data][0][:icon]}",
                    "today" => "Today #{@forecast[:daily][:data][0][:summary]}",
                    "feels_like" => "Feels Like #{formatted_temp(@forecast[:currently][:apparentTemperature])}°",
                    "humidity" => "Humidity #{formatted_humidity}%",
                    "visibility" => "Visibility #{formatted_visibility} miles",
                    "uv_index" => "UV Index #{formatted_uv_index}"
      },
      "forecast" => {
                    "hourly" => formatted_hourly_forecast_objects,
                    "daily" => formatted_daily_forecast_objects
      }
    }
  end

  private

  def formatted_date_time
    local_date_time = Time.at(0) + @forecast[:currently][:time]
    local_date_time.strftime('%l:%M %p, %_m/%e')
  end

  def formatted_location
    city_state = @city_state.strip.downcase.split(",")
    city = city_state[0].titleize
    state = city_state[1].upcase
    city + ", " + state
  end

  def formatted_humidity
    percent = @forecast[:currently][:humidity] * 100
    percent.floor
  end

  def formatted_temp(temp)
    temp.floor
  end

  def formatted_visibility
    @forecast[:currently][:visibility].round(2)
  end

  def formatted_uv_index
    uv_index = @forecast[:currently][:uvIndex]
    if uv_index < 3
      "#{uv_index} (low)"
    elsif uv_index >= 3 && uv_index < 6
      "#{uv_index} (moderate)"
    elsif uv_index >= 6 && uv_index < 8
      "#{uv_index} (high)"
    elsif uv_index >= 8 && uv_index < 11
      "#{uv_index} (very high)"
    elsif uv_index >= 11
      "#{uv_index} (extreme)"
    end
  end

  def formatted_hourly_forecast_objects
    hour_objects = @forecast[:hourly][:data][0..7]
    formatted = hour_objects.map do |hour|
      {"hour" => "#{(Time.at(0) + hour[:time]).strftime('%l %P')}",
      "hour_icon" => "#{hour[:icon]}",
      "hour_temp" => "#{formatted_temp(hour[:temperature])}°"}
    end
  end

  def formatted_daily_forecast_objects
    day_objects = @forecast[:daily][:data][1..5]
    day_objects.map do |day|
      {"time" => "#{(Time.at(0) + day[:time]).strftime('%A')}",
      "icon" => "#{day[:icon]}",
      "precipitation" => "#{day[:precipType]} #{formatted_precip_percentage(day[:precipProbability])}",
      "high_temp" => "↑ #{formatted_temp(day[:temperatureHigh])}°",
      "low_temp" => "↓ #{formatted_temp(day[:temperatureLow])}°"}
    end
  end

  def formatted_precip_percentage(chance)
    "#{(chance * 100).floor}%"
  end

end
