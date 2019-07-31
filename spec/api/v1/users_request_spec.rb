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

  it "returns api_key if user sends valid credentials" do
    user = User.create!( email: "whatever@example.com", password: "password", password_confirmation: "password")

    post "/api/v1/sessions", params: {
      "email": "whatever@example.com",
      "password": "password"
      }
    expect(response).to be_successful
    expect(response.status).to eq(200)

    result = JSON.parse(response.body)

    expect(result.values.first.class).to eq(String)
    expect(result.keys).to eq(["api_key"])
  end

  it "doesn't return api_key if user sends invalid credentials" do
    user = User.create!( email: "whatever@example.com", password: "password", password_confirmation: "password")

    post "/api/v1/sessions", params: {
      "email": "whatever@example.com",
      "password": "wrong_password"
      }

    expect(response).to be_successful
    expect(response.status).to eq(200)

    result = JSON.parse(response.body)

    expect(result).to eq("{ Please check that the email and password you've entered are correct. }")
  end

  it "doesn't return api_key if user's api_key has been deactivated" do
    user = User.create!( email: "whatever@example.com", password: "password", password_confirmation: "password", api_key_active: false)

    post "/api/v1/sessions", params: {
      "email": "whatever@example.com",
      "password": "password"
      }

    expect(response.status).to eq(400)

    result = JSON.parse(response.body)

    expect(result).to eq("{ Your api key is not active. }")
  end
end
