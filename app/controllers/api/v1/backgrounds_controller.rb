class Api::V1::BackgroundsController < ApplicationController
  def index
    render json: BackgroundImagesSerializer.new(FlickrService.get_image_urls(params[:location])), status: :ok
  end
end
