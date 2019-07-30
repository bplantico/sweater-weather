class Api::V1::GifsController < ApplicationController

  def index
    render json: GiphyService.new.find_gif(params[:location])
  end

end
