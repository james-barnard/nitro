class AddRemovedToProductLoad < ActiveRecord::Migration
  def change
    add_column :product_loads, :removed_at, :datetime
  end
end
