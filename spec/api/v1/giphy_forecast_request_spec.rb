require 'rails_helper'

describe "Giphy image API" do
  it "sends giphy image for a given search term" do
    get '/api/v1/gifs?location=denver,co'
    expect(response).to be_successful

    result = JSON.parse(response.body,symbolize_names: true)

    expect(result.count).to eq(1)
    expect(result.keys).to eq([:data])
    expect(result[:data].count).to eq(2)
    expect(result[:data].keys).to eq([:images, :copyright])
    expect(result[:data][:images].count).to eq(5)
    expect(result[:data][:images].first.keys).to eq([:time, :summary, :url])
    expect(result[:data][:images].first[:time].class).to eq(String)
    expect(result[:data][:images].first[:summary].class).to eq(String)
    expect(result[:data][:images].first[:url].class).to eq(String)
  end
end
