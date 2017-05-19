class LogEntry < ActiveRecord::Base
  belongs_to :host, inverse_of: :log_entries
end
