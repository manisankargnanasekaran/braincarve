class CreatePurchaseItems < ActiveRecord::Migration[5.1]
  def change
    create_table :purchase_items do |t|
      t.references :purchase, foreign_key: true
      t.references :inventory_item, foreign_key: true
      t.decimal :cost_per_item
      t.integer :quantity
      t.decimal :amount_without_gst
      t.decimal :amount_with_gst

      t.timestamps
    end
  end
end
