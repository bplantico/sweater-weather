class Api::V1::GiphyController < ApplicationController

  def index
    render json: GiphyService.new.find_gif(params[:q])
  end

end
