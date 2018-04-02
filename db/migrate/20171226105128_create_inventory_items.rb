class CreateInventoryItems < ActiveRecord::Migration[5.1]
  def change
    create_table :inventory_items do |t|
      t.string :book
      t.string :class_level

      t.timestamps
    end
  end
end
