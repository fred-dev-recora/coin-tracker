require 'securerandom'

class CoinTrackerResponse
  UTC_DTS = DateTime.now
  TRANSACTION_ID = SecureRandom.uuid

  def initialize(data, ex)
    @data = data
    @ex = ex
  end

  def with_ok(data)
    CoinTrackerResponse.new(data, nil)
  end

  def with_ex(ex)
    CoinTrackerResponse.new(nil, ex)
  end

end
