describe Reporter do
  before do
    Host.delete_all
    LogEntry.delete_all
  end

  it 'accepts hostname, start_datetime, end_datetime and returns hash' do
    host = Host.create!(name: '8.8.8.8')

    LogEntry.create!(ping_ms: 2, received: true, host: host, created_at: '2017-05-01 23:12:20')
    LogEntry.create!(ping_ms: 1, received: true, host: host, created_at: '2017-05-02 00:12:20')
    LogEntry.create!(ping_ms: 3, received: true, host: host, created_at: '2017-05-02 01:12:20')
    LogEntry.create!(ping_ms: 4, received: true, host: host, created_at: '2017-06-02 03:12:20')
    LogEntry.create!(ping_ms: nil, received: false, host: host, created_at: '2017-05-02 02:12:20')

    report = Reporter.report('8.8.8.8', '2017-05-01 22:12:20', '2017-05-02 04:12:20')

    expect(report).to eq({
      avg_response_ms: 2,
      min_response_ms: 1,
      max_response_ms: 3,
      percent_lost_pings: 25
    })
  end
end
