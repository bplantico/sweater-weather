class GifForecastSerializer
  attr_reader :forecast,
              :urls

  def initialize(forecast, urls)
    @forecast = forecast
    @urls = urls
  end

  def gif_forecast_index
    api_hash = Hash.new
    api_hash[:data] = {}
    api_hash[:data][:images] = daily_gif_forecasts
    api_hash[:data][:copyright] = "2019"
    api_hash
  end

  private

  def daily_gif_forecasts
    hash = @forecast.map do |daily_forecast|
    {
      time: daily_forecast.date.to_s,
      summary: daily_forecast.summary,
      url: nil
    }
    end

    hash.each_with_index do |object, index|
      object[:url] = @urls[index] if object[:url] == nil
    end
  end
end
