class CreateScheduleAssignments < ActiveRecord::Migration[7.1]
  def change
    create_table :schedule_assignments do |t|
      t.references :client, null: false, foreign_key: true
      t.references :supporter_employee, null: false, foreign_key: true
      t.references :client_schedule, null: false, foreign_key: true
      t.datetime :time, null: false
      t.boolean :confirmed_time, null: false

      t.timestamps
    end
  end
end
