class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.text :img_url
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :items, :deleted_at
  end
end
