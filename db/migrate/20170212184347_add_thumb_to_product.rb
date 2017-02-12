class AddThumbToProduct < ActiveRecord::Migration
  def change
    add_column :products, :thumb, :string
  end
end
