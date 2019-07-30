class MunchiesSerializer
  attr_reader :yelp_results,
              :display_city

  def initialize(yelp_results, display_city)
    @yelp_results = yelp_results
    @city = display_city
  end

  def munchies_index
    hash = Hash.new
    hash["city"] = @city
    hash["restaurants"] = @yelp_results
    hash
  end
end
