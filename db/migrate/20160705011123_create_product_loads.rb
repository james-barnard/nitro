class CreateProductLoads < ActiveRecord::Migration
  def change
    create_table :product_loads do |t|
      t.references :local_product, index: true, foreign_key: true
      t.references :vending_machine, index: true, foreign_key: true
      t.integer :total_pours
      t.timestamp :date_loaded

      t.timestamps null: false
    end
  end
end
