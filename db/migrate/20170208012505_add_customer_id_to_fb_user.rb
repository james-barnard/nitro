class AddCustomerIdToFbUser < ActiveRecord::Migration
  def change
    add_column :fb_users, :customer_id, :integer
  end
end
