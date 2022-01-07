require 'httparty'

class GeminiClient
  URL = GeminiConstants::URL
  SYMBOL = GeminiConstants::SYMBOLS[0]

  def try_read_ticker
    response = HTTParty.get(url + SYMBOL)
    response.code == 200 ? response.body : raise StandardError.new response.code
  end
end
