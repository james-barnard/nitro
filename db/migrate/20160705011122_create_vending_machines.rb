class CreateVendingMachines < ActiveRecord::Migration
  def change
    create_table :vending_machines do |t|
      t.string :model
      t.string :firmware_version
      t.references :location, index: true, foreign_key: true
      t.references :route, index: true, foreign_key: true
      t.string :owner
      t.timestamp :last_serviced

      t.timestamps null: false
    end
  end
end
