class AddLast4ToFbUser < ActiveRecord::Migration
  def change
    add_column :fb_users, :last4, :string
  end
end
