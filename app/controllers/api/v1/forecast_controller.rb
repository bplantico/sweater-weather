class Api::V1::ForecastController < ApplicationController

  def show
    city_state = forecast_params[:location].gsub(',',',+').gsub(' ','+')
    google_conn = Faraday.new(:url => 'https://maps.googleapis.com') do |faraday|
      faraday.params['key'] = ENV['GOOGLE_GEOCODE_API_KEY']
      faraday.params['address'] = city_state
      faraday.adapter Faraday.default_adapter
    end
    google_response = google_conn.get("/maps/api/geocode/json")
    google_results = JSON.parse(google_response.body, symbolize_names: true)[:results][0]
    lat_long = google_results[:geometry][:location]
    latitude = lat_long[:lat]
    longitude = lat_long[:lng]

    dark_sky_response = Faraday.get "https://api.darksky.net/forecast/#{ENV['DARK_SKY_SECRET_KEY']}/#{latitude},#{longitude}"
    dark_sky_forecast = JSON.parse(dark_sky_response.body, symbolize_names: true)

    render json: ForecastSerializer.new(dark_sky_forecast).all_details
  end

  private

  def forecast_params
    params.permit(:location)
  end

end
