class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :cell_phone
      t.string :office_phone
      t.references :location, index: true, foreign_key: true
      t.references :organization, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
