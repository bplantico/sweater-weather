class Api::V1::MunchiesController < ApplicationController
  def index
    origin = params[:start]
    destination = params[:end]
    trip_duration = GoogleDirectionsService.new.get_duration(origin, destination)

    food_type = params[:food]
    arrival_time = (Time.now + trip_duration).to_i

    yelp_results = YelpBusinessSearchService.new.get_restaurants(destination, food_type, arrival_time)
    display_city = params[:end].strip.split(',')[0].titleize

    render json: MunchiesSerializer.new(yelp_results, display_city).munchies_index
  end
end
