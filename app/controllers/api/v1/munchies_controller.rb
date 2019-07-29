class Api::V1::MunchiesController < ApplicationController
  def index
    origin = params[:start].gsub(',',',+').gsub(' ','+')
    destination = params[:end].gsub(',',',+').gsub(' ','+')

    directions_conn = Faraday.new(:url => 'https://maps.googleapis.com') do |faraday|
      faraday.params['key'] = ENV['GOOGLE_GEOCODE_API_KEY']
      faraday.params['origin'] = origin
      faraday.params['destination'] = destination
      faraday.adapter Faraday.default_adapter
    end
    directions_response = directions_conn.get("/maps/api/directions/json")
    google_result = JSON.parse(directions_response.body, symbolize_names: true)[:routes][0][:legs][0]

    # Prepping params to send to YELP API
    trip_duration = google_result[:duration][:value]
    destination_coords = google_result[:end_location]
    end_lat = destination_coords[:lat]
    end_lng = destination_coords[:lng]
    leave_at = Time.now
    arrival_time = (leave_at + trip_duration).to_i
    food_type = params[:food]

    # GREAT! SEND THESE TO YELP FTW

    yelp_conn = Faraday.new(:url => 'https://api.yelp.com') do |faraday|
      faraday.params['latitude'] = end_lat
      faraday.params['longitude'] = end_lng
      faraday.params['limit'] = 3
      faraday.params['open_at'] = arrival_time
      faraday.params['term'] = food_type
      faraday.adapter Faraday.default_adapter
    end
    yelp_conn.authorization :Bearer, ENV['YELP_API_KEY']
    yelp_response = yelp_conn.get("/v3/businesses/search")
    yelp_results = JSON.parse(yelp_response.body, symbolize_names: true)[:businesses]
    require "pry"; binding.pry
  end
end
