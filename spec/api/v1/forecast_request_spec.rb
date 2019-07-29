require 'rails_helper'

describe "Forecast API" do
  it "sends a forecast for a given location" do
    get '/api/v1/forecast?location=denver,co'
    expect(response).to be_successful

    forecast = JSON.parse(response.body)

    expect(forecast.count).to eq(2)
  end
end
