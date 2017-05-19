class CreateHosts < ActiveRecord::Migration[5.1]
  def change
    create_table :hosts do |t|
      t.string :name, index: { unique: true }
      t.timestamps
    end
  end
end
