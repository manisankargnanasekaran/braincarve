class CreatePurchases < ActiveRecord::Migration[5.1]
  def change
    create_table :purchases do |t|
      t.datetime :purchase_date
      t.string :vendor_name
      t.boolean :paid_status
      t.string :bill_no
      t.decimal :total_amount
      t.decimal :balance_amount

      t.timestamps
    end
  end
end
