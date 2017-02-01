class AddPosMachineToFbUser < ActiveRecord::Migration
  def change
    add_column :fb_users, :pos_machine_id, :integer
  end
end
