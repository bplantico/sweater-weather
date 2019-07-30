class GoogleDirectionsService
  def get_duration(origin, destination)
    directions_response = directions_conn(origin, destination).get("/maps/api/directions/json")
    directions_result = JSON.parse(directions_response.body, symbolize_names: true)
    time_in_sec = directions_result[:routes][0][:legs][0][:duration][:value]
  end

  private

  def directions_conn(origin, destination)
    Faraday.new(:url => 'https://maps.googleapis.com') do |faraday|
      faraday.params['key'] = ENV['GOOGLE_GEOCODE_API_KEY']
      faraday.params['origin'] = origin
      faraday.params['destination'] = destination
      faraday.adapter Faraday.default_adapter
    end
  end
end
