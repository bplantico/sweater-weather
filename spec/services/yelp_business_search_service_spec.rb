require 'rails_helper'

RSpec.describe YelpBusinessSearchService do
  it "gets restaurants for a given location" do
    service = YelpBusinessSearchService.new
    restaurants = service.get_restaurants('pueblo,co', 'chinese', Time.now.to_i)
    expect(restaurants.class).to eq(Array)
    expect(restaurants.count).to eq(3)
  end
end
