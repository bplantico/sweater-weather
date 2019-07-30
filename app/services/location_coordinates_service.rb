class LocationCoordinatesService
  def get_coordinates(location)
    google_conn = Faraday.new(:url => 'https://maps.googleapis.com') do |faraday|
      faraday.params['key'] = ENV['GOOGLE_GEOCODE_API_KEY']
      faraday.params['address'] = location
      faraday.adapter Faraday.default_adapter
    end
    google_response = google_conn.get("/maps/api/geocode/json")

    google_results = JSON.parse(google_response.body, symbolize_names: true)[:results][0]
    lat_long = google_results[:geometry][:location]
  end
end

# circle back to refactor this connection into it's own method
