class Api::V1::GifsforecastController < ApplicationController

  def index
    location = params[:location].split(',').first
    five_day_forecast = ForecastService.new.get_five_day_forecast(location)

    search_terms = five_day_forecast.map do |day|
      'weather ' + day.summary.gsub('.',' ') + ' ' + location
    end

    gif_urls = search_terms.map do |search_term|
      gif = GiphyService.new.find_gif(search_term)
      gif.first.url
    end

    render json: GifForecastSerializer.new(five_day_forecast, gif_urls).gif_forecast_index, status: :ok
  end

end
