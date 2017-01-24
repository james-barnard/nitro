class AddFbUserIdToParts < ActiveRecord::Migration
  def change
    add_column :parts, :fb_user_id, :integer
  end
end
