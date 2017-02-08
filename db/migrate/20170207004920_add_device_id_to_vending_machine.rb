class AddDeviceIdToVendingMachine < ActiveRecord::Migration
  def change
    add_column :vending_machines, :device_id, :string
  end
end
