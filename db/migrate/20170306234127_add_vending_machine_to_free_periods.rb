class AddVendingMachineToFreePeriods < ActiveRecord::Migration
  def change
    add_column :free_periods, :vending_machine_id, :integer
  end
end
