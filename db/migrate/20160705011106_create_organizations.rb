class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :cell_phone
      t.string :office_phone
      t.references :location, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
