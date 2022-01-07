class CryptoTokenReading
  def initialize(name, price)
    @name = name
    @price = price
    @read_at = DateTime.now
  end
end
