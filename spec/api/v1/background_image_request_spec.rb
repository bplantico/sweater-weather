require 'rails_helper'

describe "Background image API" do
  it "sends a background image for a given location" do
    get '/api/v1/backgrounds?location=denver,co'
    expect(response).to be_successful

    background_images = JSON.parse(response.body)
    expect(background_images["background_image_urls"].count).to eq(24)
  end
end

# circle back to refactor this test with a mock/stub since currently brittle
# because results could easily change and start failing test
