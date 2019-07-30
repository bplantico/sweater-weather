require 'rails_helper'

RSpec.describe DailyForecastService do
  it "gets five day forecast with day and summary given location coords" do
    service = DailyForecastService.new
    location = {:lat=>39.7392358, :lng=>-104.990251}
    forecast = service.get_five_day_forecast(location)
    expect(forecast.class).to eq(Array)
  end
end
