require 'rubygems'
require 'bundler'
Bundler.require(:default, :development)

configuration = YAML::load(IO.read(__dir__ + '/../db/config.yml'))
ActiveRecord::Base.establish_connection(configuration['development'])

require_relative '../lib/models/host'
require_relative '../lib/models/log_entry'
require_relative '../lib/reporter'
