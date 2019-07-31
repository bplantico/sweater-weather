class Api::V1::SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      if user.api_key_active
        session[:user_id] = user.id
        render json: UserSerializer.new(user), status: :ok
      else
        render json: "{ Something went wrong. }".to_json, status: :bad_request
      end
    else
      render json: "{ Sorry, that email and password don't match. }".to_json
    end
  end
end
