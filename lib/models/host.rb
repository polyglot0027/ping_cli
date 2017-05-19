class Host < ActiveRecord::Base
  has_many :log_entries, inverse_of: :host

  validates :name, presence: true
end
