class Api::V1::RoadtripController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def show
    user = User.find_by(api_key: trip_params[:api_key])
    if user && user.api_key_active
      trip_duration = GoogleDirectionsService.get_duration(trip_params[:origin], trip_params[:destination])

      arrival_time = (Time.now + trip_duration).to_i
      full_forecast = ForecastService.get_roadtrip_forecast(params[:destination], arrival_time)
      render json: RoadTripSerializer.new(RoadTripForecast.new(full_forecast, trip_duration))
    else
      render json: "{ We can't find an active API key matching the one you provided }".to_json, status: :unauthorized
    end
  end

  private

  def trip_params
    params.permit(:origin, :destination, :api_key)
  end

end
