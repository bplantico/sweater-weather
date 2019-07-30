require 'rails_helper'

describe "Giphy image API" do
  it "sends giphy image for a given search term" do
    get '/api/v1/giphy?q=denver,co'
    expect(response).to be_successful

    result = JSON.parse(response.body)
  end
end
