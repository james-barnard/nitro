class RenameColumn < ActiveRecord::Migration
  def change
    rename_column :part, :type, :part_type
  end
end
