class AddMinQuantityToInventoryItems < ActiveRecord::Migration[5.1]
  def change
    add_column :inventory_items, :min_quantity, :integer
    add_column :inventory_items, :gst_percentage, :float
    add_column :inventory_items, :unit, :string
    add_column :inventory_items, :cost_per_item, :decimal
  end
end
