require_relative 'config/initialize'
require 'standalone_migrations'

StandaloneMigrations::Tasks.load_tasks

namespace :hosts do
  desc 'Adds hostname to hostnames list '
  task :add, [:hostname] do |t, args|
    begin
      Host.create!(name: args.hostname)
      puts "Host #{args.hostname} added successfully"
    rescue ActiveRecord::RecordNotUnique
      puts "The host #{args.hostname} already exists"
    rescue StandardError => e
      puts({ error: e.message }.to_json)
    end
  end

  desc 'Deletes hostname from hostnames list'
  task :delete, [:hostname] do |t, args|
    begin
      host = Host.find_by_name!(args.hostname)
      host.destroy
      puts "Host #{args.hostname} deleted successfully"
    rescue ActiveRecord::RecordNotFound
      puts "The host #{args.hostname} doesn't exist"
    rescue StandardError => e
      puts({ error: e.message }.to_json)
    end
  end
end

desc 'Shows report as JSON'
task :report, [:hostname, :start_datetime, :end_datetime] do |t, args|
  # use time of the current machine
  Time.zone = Time.now.utc_offset
  start_datetime = Time.zone.parse(args.start_datetime)
  end_datetime = Time.zone.parse(args.end_datetime)

  begin
    puts Reporter.report(args.hostname, start_datetime, end_datetime).to_json
  rescue NoMethodError
    puts "The host #{hostname} doesn't exist"
  rescue StandardError => e
    puts({ error: e.message }.to_json)
  end
end
