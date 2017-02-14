class RenameThumbToThumbnail < ActiveRecord::Migration
  def change
    rename_column :products, :thumb, :thumbnail
  end
end
