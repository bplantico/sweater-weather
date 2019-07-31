require 'rails_helper'

RSpec.describe FlickrService do
  it "gets image URLS for a given location" do
    location = 'denver,co'
    backgrounds = FlickrService.get_image_urls(location)
    expect(backgrounds.class).to eq(Array)
  end
end
