class BackgroundImagesSerializer

  def initialize(background_image_urls)
    @background_image_urls = background_image_urls
  end

  def url
    quantity = 1
    @background_image_urls.sample(quantity)[0]
  end
end
