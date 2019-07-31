class Api::V1::ForecastController < ApplicationController

  def show
    lat_long = LocationCoordinatesService.new.get_coordinates(params[:location])
    latitude = lat_long[:lat]
    longitude = lat_long[:lng]
    dark_sky_response = Faraday.get "https://api.darksky.net/forecast/#{ENV['DARK_SKY_SECRET_KEY']}/#{latitude},#{longitude}"
    dark_sky_forecast = JSON.parse(dark_sky_response.body, symbolize_names: true)
    render json: ForecastSerializer.new(dark_sky_forecast, params[:location]).all_details
  end
end
