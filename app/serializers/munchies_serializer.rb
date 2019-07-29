class MunchiesSerializer

  def initialize(yelp_results)
    @yelp_results = yelp_results
  end

  def results
    formatted = @yelp_results.map do |result|
      "Name: #{result[:name]}
      Address: #{result[:location][:display_address]}"
    end
    formatted
  end


end
