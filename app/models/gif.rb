class Gif

  attr_reader :id,
              :url

  def initialize(gif_attributes)
    @id  = gif_attributes[:id]
    @url = gif_attributes[:images][:original][:url]
  end

end
