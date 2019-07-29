class MunchiesSerializer
  attr_reader :yelp_results,
              :display_city

  def initialize(yelp_results, display_city)
    @yelp_results = yelp_results
    @city = display_city
  end

  def munchies_index
    restaurants_hash = Hash.new
    restaurants = @yelp_results.map do |restaurant|
      restaurant_hash_object = {"name" => "#{restaurant[:name]}", "address" => "#{restaurant[:location][:display_address]}"}
    end

    hash = Hash.new
    hash["city"] = @city
    hash["restaurants"] = restaurants
    hash.to_json
  end
end
