require 'rails_helper'

describe "Background image API" do
  it "sends a background image for a given location" do
    get '/api/v1/backgrounds?location=denver,co'
    expect(response).to be_successful

    forecast = JSON.parse(response.body)

    expect(background_image["url"].count).to eq(1)
  end
end
