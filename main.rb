require_relative 'config/initialize'

request_interval = ARGV[0].to_i
request_counter = 1

loop do
  Host.pluck(:id, :name).each do |host_id, hostname|
    icmp = Net::Ping::External.new(hostname)
    if icmp.ping
      ping_ms = (icmp.duration * 1000).round
      puts "hostname: #{hostname}"
      puts "response time: #{ping_ms} ms\n\n"

      LogEntry.create!(host_id: host_id, ping_ms: ping_ms)
    else
      LogEntry.create!(host_id: host_id, received: false)
    end
  end
  if request_interval
    sleep(request_interval)
    puts "request interval: #{request_interval} sec"
    puts "------------------------\n\n"
  else
    sleep 60
  end
  puts "[Request total: #{request_counter += 1}]"
end
