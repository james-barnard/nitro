class AddLocSkippedToFbUser < ActiveRecord::Migration
  def change
    add_column :fb_users, :loc_skipped, :bool
  end
end
