class CreateSupporterEmployees < ActiveRecord::Migration[7.1]
  def change
    create_table :supporter_employees do |t|
      t.string :name, null: false
      t.string :assigned_color, null: false

      t.timestamps
    end
  end
end
