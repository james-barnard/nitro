class AddModeToVendingMachines < ActiveRecord::Migration
  def change
    add_column :vending_machines, :mode, :boolean
  end
end
