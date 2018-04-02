class CreateFranchiseeInventoryStocks < ActiveRecord::Migration[5.1]
  def change
    create_table :franchisee_inventory_stocks do |t|
      t.references :franchisee, foreign_key: true
      t.references :inventory_item, foreign_key: true
      t.integer :available_qty

      t.timestamps
    end
  end
end
