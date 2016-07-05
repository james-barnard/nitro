class CreateLocalProducts < ActiveRecord::Migration
  def change
    create_table :local_products do |t|
      t.references :product, index: true, foreign_key: true
      t.references :brewery, index: true, foreign_key: true
      t.references :region, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
