class CreateKegs < ActiveRecord::Migration
  def change
    create_table :kegs do |t|
      t.string :kid
      t.integer :size

      t.timestamps null: false
    end
    add_index :kegs, :kid, unique: true
  end
end
