class Api::V1::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def create
    user = User.find_by(email: user_params[:email])
    if user.nil?
      user = User.new(user_params)
      if user.save
        render json: UserSerializer.new(user), status: :created
      else
        render json: "{ Something went wrong }", status: :bad_request
      end
    else
      render json: UserSerializer.new(user), status: :ok
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end

end
