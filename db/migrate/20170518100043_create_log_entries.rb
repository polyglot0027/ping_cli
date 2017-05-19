class CreateLogEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :log_entries do |t|
      t.integer :ping_ms
      t.boolean :received, default: true
      t.references :host, null: false
      t.datetime :created_at, index: true, null: false
    end
  end
end
