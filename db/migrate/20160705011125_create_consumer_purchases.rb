class CreateConsumerPurchases < ActiveRecord::Migration
  def change
    create_table :consumer_purchases do |t|
      t.references :consumer, index: true, foreign_key: true
      t.references :pos_vehicle, index: true, foreign_key: true
      t.references :product_load, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
