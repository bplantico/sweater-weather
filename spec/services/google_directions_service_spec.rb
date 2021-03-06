require 'rails_helper'

RSpec.describe GoogleDirectionsService do
  it "gets trip duration from google directions api" do
    duration = GoogleDirectionsService.get_duration('denver,co','pueblo,co')
    expect(duration.class).to eq(Integer)
  end
end
