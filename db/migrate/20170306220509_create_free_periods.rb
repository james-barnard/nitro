class CreateFreePeriods < ActiveRecord::Migration
  def change
    create_table :free_periods do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.string :note

      t.timestamps null: false
    end
  end
end
