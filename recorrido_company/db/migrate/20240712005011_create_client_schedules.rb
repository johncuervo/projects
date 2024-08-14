class CreateClientSchedules < ActiveRecord::Migration[7.1]
  def change
    create_table :client_schedules do |t|
      t.references :client, null: false, foreign_key: true
      t.datetime :start_hour, null: false
      t.datetime :end_hour, null: false
      t.string :day_of_week, null: false

      t.timestamps
    end
  end
end
