class CreateFbUsers < ActiveRecord::Migration
  def change
    create_table :fb_users do |t|
      t.string :first_name
      t.string :last_name
      t.string :sender_id
      t.decimal :lat
      t.decimal :long

      t.timestamps null: false
    end
  end
end
