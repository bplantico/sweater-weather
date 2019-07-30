class GoogleDirectionsService
  def get_duration(origin, destination)
    directions_conn = Faraday.new(:url => 'https://maps.googleapis.com') do |faraday|
      faraday.params['key'] = ENV['GOOGLE_GEOCODE_API_KEY']
      faraday.params['origin'] = origin
      faraday.params['destination'] = destination
      faraday.adapter Faraday.default_adapter
    end
    directions_response = directions_conn.get("/maps/api/directions/json")
    google_result = JSON.parse(directions_response.body, symbolize_names: true)[:routes][0][:legs][0]
    google_result[:duration][:value]
  end

end
