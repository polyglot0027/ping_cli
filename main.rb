require_relative 'config/initialize'

loop do
  Host.pluck(:id, :name).each do |host_id, hostname|
    icmp = Net::Ping::External.new(hostname)
    if icmp.ping
      ping_ms = (icmp.duration * 1000).round
      puts hostname
      puts ping_ms

      LogEntry.create!(host_id: host_id, ping_ms: ping_ms)
    else
      LogEntry.create!(host_id: host_id, received: false)
    end
  end
  sleep 60
end
