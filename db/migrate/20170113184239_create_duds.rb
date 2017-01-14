class CreateDuds < ActiveRecord::Migration
  def change
    create_table :duds do |t|
      t.references :run
      t.references :product_load
      t.text :status
    end
  end
end
