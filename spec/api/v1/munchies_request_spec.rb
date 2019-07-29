require 'rails_helper'

describe "Munchies API" do
  it "sends a 3 open restaurants for a given location and travel time" do
    get '/api/v1/munchies?start=denver,co&end=pueblo,co&food=chinese'
    expect(response).to be_successful

    restaurants = JSON.parse(response.body)
    expect(restaurants.count).to eq(3)
  end
end
