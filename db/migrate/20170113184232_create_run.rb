class CreateRun < ActiveRecord::Migration
  def change
    create_table :runs do |t|
      t.references :route
      t.text :status
    end
  end
end
