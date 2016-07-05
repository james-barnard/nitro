class CreateBreweries < ActiveRecord::Migration
  def change
    create_table :breweries do |t|
      t.references :region, index: true, foreign_key: true
      t.string :name
      t.references :person, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
