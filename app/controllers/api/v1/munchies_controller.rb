class Api::V1::MunchiesController < ApplicationController
  def index
    origin = params[:start].gsub(',',',+').gsub(' ','+')
    destination = params[:end].gsub(',',',+').gsub(' ','+')
    trip_duration = GoogleDirectionsService.new.get_duration(origin, destination)

    leave_at = Time.now
    arrival_time = (leave_at + trip_duration).to_i
    food_type = params[:food]

    yelp_results = YelpBusinessSearchService.new.get_restaurants(destination, food_type, arrival_time)
    display_city = params[:end].strip.split(',')[0].titleize

    render json: MunchiesSerializer.new(yelp_results, display_city).munchies_index
  end
end
