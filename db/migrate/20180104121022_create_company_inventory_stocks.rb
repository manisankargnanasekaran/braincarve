class CreateCompanyInventoryStocks < ActiveRecord::Migration[5.1]
  def change
    create_table :company_inventory_stocks do |t|
      t.references :inventory_item, foreign_key: true
      t.integer :available_qty

      t.timestamps
    end
  end
end
