class InfluxReadJob < ActiveJob::Base
  queue_as :default

  def try_read(query)
    influx_client = InfluxClient.new
    data = influx_client.read(query)
    data !=null ? CoinTrackerResponse.with_ok(data) : CoinTrackerResponse.with_ex("ERROR")
  end

end
