require 'influxdb-client'

class InfluxClient
  client = InfluxDB2::Client.new(InfluxConstants::URL, InfluxConstants::TOKEN,
                                 precision: InfluxDB2::WritePrecision::NANOSECOND)

  def write(data)
    write_api = client.create_write_api
    write_api.write(data: data, bucket: bucket, org: org)
  end

  def read(q)

    query = "from(bucket: \"CoinTracker\") |> range(start: -1h)"
    tables = client.create_query_api.query(query: query, org: InfluxConstants::ORG)
    tables.each do |_, table|
      table.records.each do |record|
        puts "#{record.time} #{record.measurement}: #{record.field}=#{record.value}"
      end
    end
  end

end
