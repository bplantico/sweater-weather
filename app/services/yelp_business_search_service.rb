class YelpBusinessSearchService
  def get_restaurants(location, type, open_at)
    yelp_conn = Faraday.new(:url => 'https://api.yelp.com') do |faraday|
      faraday.params['location'] = location
      faraday.params['limit'] = 3
      faraday.params['open_at'] = open_at
      faraday.params['term'] = type
      faraday.adapter Faraday.default_adapter
    end
    yelp_conn.authorization :Bearer, ENV['YELP_API_KEY']
    yelp_response = yelp_conn.get("/v3/businesses/search")
    yelp_results = JSON.parse(yelp_response.body, symbolize_names: true)[:businesses]
    yelp_results.map do |result|
      {
        name: result[:name],
        address: result[:location][:display_address][0]
      }
    end
  end
end
