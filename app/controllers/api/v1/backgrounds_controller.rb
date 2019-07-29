class Api::V1::BackgroundsController < ApplicationController
  def index
    location = params[:location]
    flickr_conn = Faraday.new(:url => 'https://www.flickr.com') do |faraday|
      faraday.params['api_key'] = ENV['FLICKR_API_KEY']
      faraday.params['method'] = 'flickr.photos.search'
      faraday.params['text'] = "#{location}" + " downtown" + " skyline"
      faraday.params['extras'] = 'url_o'
      faraday.params['sort'] = 'relevance'
      faraday.params['pages'] = '1'
      faraday.params['per_page'] = '50'
      faraday.params['format'] = 'json'
      faraday.params['nojsoncallback'] = 'true'
      faraday.adapter Faraday.default_adapter
    end
    flickr_response = flickr_conn.get("/services/rest/")
    flickr_results = JSON.parse(flickr_response.body, symbolize_names: true)[:photos][:photo]
    background_images_array = flickr_results.map { |result| result[:url_o] }
    background_image_urls = background_images_array.compact

    render json: BackgroundImagesSerializer.new(background_image_urls)
  end
end
