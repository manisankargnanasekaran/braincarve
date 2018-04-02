class CreateOrderRequestItems < ActiveRecord::Migration[5.1]
  def change
    create_table :order_request_items do |t|
      t.references :order_request, foreign_key: true
      t.references :inventory_item, foreign_key: true
      t.integer :request_qty
      t.decimal :cost_per_item
      t.decimal :amount

      t.timestamps
    end
  end
end
