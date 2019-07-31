require 'rails_helper'

describe "Road trip API" do
  it "sends the forecast at arrival time at a destination" do
    user = User.create!( email: "whatever@example.com", password: "password", password_confirmation: "password")

    post '/api/v1/road_trip', params: {
      "origin": "Denver,CO",
      "destination": "Pueblo,CO",
      "api_key": "#{user.api_key}"
    }

    expect(response).to be_successful

    result = JSON.parse(response.body, symbolize_names: true)
    
    expect(result[:data].count).to eq(3)
    expect(result[:data][:attributes].keys).to eq([:summary, :temperature, :est_travel_time])
  end
end
