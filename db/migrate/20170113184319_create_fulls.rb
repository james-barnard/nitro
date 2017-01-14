class CreateFulls < ActiveRecord::Migration
  def change
    create_table :fulls do |t|
      t.references :run
      t.references :local_product
      t.text :status
    end
  end
end
