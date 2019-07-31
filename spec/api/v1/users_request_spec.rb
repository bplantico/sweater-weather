require 'rails_helper'

describe 'Users API', type: :request do
  it "creates an account for a user and retruns an api_key" do

    post "/api/v1/users", params: {
      "email": "whatever@example.com",
      "password": "password",
      "password_confirmation": "password"
      }
    expect(response).to be_successful
    expect(response.status).to eq(201)

    result = JSON.parse(response.body)

    expect(result.values.first.class).to eq(String)
    expect(result.keys).to eq(["api_key"])
  end

  it "returns api_key if user already exists" do
    user = User.create!( email: "whatever@example.com", password: "password", password_confirmation: "password")

    post "/api/v1/users", params: {
      "email": "whatever@example.com",
      "password": "password",
      "password_confirmation": "password"
      }
      
    expect(response).to be_successful

    result = JSON.parse(response.body)

    expect(result.values.first.class).to eq(String)
    expect(result.keys).to eq(["api_key"])
  end
end
