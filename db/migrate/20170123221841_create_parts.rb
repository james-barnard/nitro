class CreateParts < ActiveRecord::Migration
  def change
    create_table :parts do |t|
      t.string :meaning
      t.string :type
      t.string :selection
      t.string :mid
      t.integer :seq

      t.timestamps null: false
    end
  end
end
