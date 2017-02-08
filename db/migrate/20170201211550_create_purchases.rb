class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.references :product_load, index: true, foreign_key: true
      t.references :fb_user, index: true, foreign_key: true
      t.string :pos_type
      t.integer :amount

      t.timestamps null: false
    end
  end
end
