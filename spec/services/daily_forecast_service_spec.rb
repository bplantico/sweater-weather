require 'rails_helper'

RSpec.describe DailyForecastService do
  it "gets five day forecast with day and summary given location coords" do
    service = DailyForecastService.new
    location = 'denver,co'
    forecast = service.get_five_day_forecast(location)
    expect(forecast.class).to eq(Array)
  end
end
