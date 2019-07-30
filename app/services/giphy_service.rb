class GiphyService

  def find_gif(search_term)
    response(search_term, 'gifs/search')[:data].map do |gif|
      Gif.new(gif)
    end
  end

  private

  def conn(search_term)
    Faraday.new("url" => 'http://api.giphy.com/v1/') do |faraday|
      faraday.params['api_key'] = ENV['GIPHY_API_KEY']
      faraday.params['q'] = search_term
      faraday.params['limit'] = 1
      faraday.adapter Faraday.default_adapter
    end
  end

  def response(search_term, path)
    result = conn(search_term).get(path)
    JSON.parse(result.body, symbolize_names: true)
  end
end
