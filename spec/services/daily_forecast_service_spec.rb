require 'rails_helper'

RSpec.describe ForecastService do
  it "gets five day forecast with day and summary given location coords" do
    service = ForecastService.new
    location = 'denver,co'
    forecast = service.get_five_day_forecast(location)
    expect(forecast.class).to eq(Array)
  end
end
