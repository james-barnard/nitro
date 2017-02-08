class AddValveToProductLoad < ActiveRecord::Migration
  def change
    add_column :product_loads, :valve, :integer
  end
end
