# coding: utf-8

class ForecastSerializer
  def initialize(forecast, location)
    @forecast = forecast
    @location = location
  end

  def all_details
    {
      "currently" => {
                     "summary" => "#{@forecast[:currently][:summary]}",
                     "temperature" => "#{@forecast[:currently][:temperature]}",
                     "time_and_date" => formatted_date_time,
                     "high" => "High: #{@forecast[:daily][:data][0][:temperatureHigh]}",
                     "low" => "Low: #{@forecast[:daily][:data][0][:temperatureLow]}",
                     "location" => formatted_location
                   },
      "details" => {
                    "icon" => "#{@forecast[:daily][:data][0][:icon]}",
                    "today" => "Today: #{@forecast[:daily][:data][0][:summary]}",
                    "feels_like" => "Feels Like: #{@forecast[:currently][:apparentTemperature]}",
                    "humidity" => "Humidity: #{formatted_humidity}%"
                   }
    }
    # build out the serializer to only return the results that we want for the view here.
    # i.e. currently section, currently_details section, forecast_section for hourly,
    # forecast_section for daily etc
  end

  def formatted_date_time
    local_date_time = Time.at(0) + @forecast[:currently][:time]
    local_date_time.strftime('%l:%M %p, %_m/%e')
  end

  def formatted_location
    city_state = @location.strip.downcase.split(",")
    city = city_state[0].titleize
    state = city_state[1].upcase
    city + ", " + state
  end

  def formatted_humidity
    percent = @forecast[:currently][:humidity] * 100
    percent.floor
  end

end
