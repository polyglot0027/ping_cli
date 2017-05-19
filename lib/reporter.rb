class Reporter
  class << self
    def report(hostname, start_datetime, end_datetime)
      host = Host.find_by_name!(hostname)

      log_entries = host.log_entries.where(
        'created_at BETWEEN ? AND ?', start_datetime, end_datetime
      )

      received_pings = log_entries.where(received: true).pluck(:ping_ms)
      lost_pings = log_entries.where(received: false)

      min_response_ms = received_pings.min.round
      max_response_ms = received_pings.max.round

      if log_entries.blank?
        avg_response_ms    = 0
        percent_lost_pings = 0
      else
        avg_response_ms = (received_pings.sum.to_f / received_pings.size).round
        percent_lost_pings = ((lost_pings.size.to_f / log_entries.size) * 100).round
      end

      {
        hostname: hostname,
        avg_response_ms: avg_response_ms,
        min_response_ms: min_response_ms,
        max_response_ms: max_response_ms,
        percent_lost_pings: percent_lost_pings
      }
    end
  end
end
