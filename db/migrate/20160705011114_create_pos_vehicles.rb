class CreatePosVehicles < ActiveRecord::Migration
  def change
    create_table :pos_vehicles do |t|
      t.string :name
      t.string :access_code
      t.string :url

      t.timestamps null: false
    end
  end
end
