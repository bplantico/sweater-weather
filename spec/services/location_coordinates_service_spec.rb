require 'rails_helper'

RSpec.describe LocationCoordinatesService do
  it "gets lat and long coords for a given lcoation" do
    service = LocationCoordinatesService.new
    coords = service.get_coordinates('denver,co')
    expect(coords.class).to eq(Hash)
  end
end
