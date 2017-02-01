class AddPosConfirmedToFbUser < ActiveRecord::Migration
  def change
    add_column :fb_users, :pos_confirmed, :boolean
  end
end
