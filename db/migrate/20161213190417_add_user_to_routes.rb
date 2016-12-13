class AddUserToRoutes < ActiveRecord::Migration
  def change
    add_column :routes, :user_id, :integer, index: true
  end
end
