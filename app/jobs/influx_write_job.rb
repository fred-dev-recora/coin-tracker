require 'json'

class InfluxWriteJob < ActiveJob::Base
  queue_as :default
  GEMINI_CLIENT = GeminiClient.new

  def try_write(data)
    crypto_reading = GEMINI_CLIENT.try_read_ticker()

    influx_client = InfluxClient.new
    influx_client.write(data)
  end

end
