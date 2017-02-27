class ChangeCustomerIdColumn < ActiveRecord::Migration
  def change
    change_column :fb_users, :customer_id, :string
  end
end
