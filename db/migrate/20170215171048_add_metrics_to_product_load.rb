class AddMetricsToProductLoad < ActiveRecord::Migration
  def change
    add_column :product_loads, :enabled, :integer
    add_column :product_loads, :poured, :integer
  end
end
