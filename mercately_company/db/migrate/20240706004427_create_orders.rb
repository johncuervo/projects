class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.string :order_number
      t.decimal :total_price
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :orders, :deleted_at
  end
end
