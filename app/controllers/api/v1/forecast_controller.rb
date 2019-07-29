class Api::V1::ForecastController < ApplicationController

  def show
    city_state = params[:location].gsub(',',',+').gsub(' ','+')
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
    country = google_results[:address_components][3][:long_name]

    dark_sky_response = Faraday.get "https://api.darksky.net/forecast/#{ENV['DARK_SKY_SECRET_KEY']}/#{latitude},#{longitude}"
    dark_sky_forecast = JSON.parse(dark_sky_response.body, symbolize_names: true)

    render json: ForecastSerializer.new(dark_sky_forecast, params[:location], country).all_details
  end
end
