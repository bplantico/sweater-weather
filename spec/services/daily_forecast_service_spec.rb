require 'rails_helper'

RSpec.describe DailyForecastService do
  it "gets five day forecast with day and summary from dark sky api" do
    service = DailyForecastService.new
    forecast = service.get_five_day_forecast('denver,co')
    expect(forecast.class).to eq(Array)
  end
end
