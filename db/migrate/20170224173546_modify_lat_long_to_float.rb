class ModifyLatLongToFloat < ActiveRecord::Migration
  def up
    change_column :locations, :lat, :float
    change_column :locations, :long, :float
  end
  def down
    change_column :locations, :lat, :decimal
    change_column :locations, :long, :decimal
  end
end
