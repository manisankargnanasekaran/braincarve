class CreateInvoices < ActiveRecord::Migration[5.1]
  def change
    create_table :invoices do |t|
      t.date :invoice_date
      t.references :order_request, foreign_key: true
      t.decimal :total_amount
      t.decimal :balance_amount
      t.boolean :paid_status

      t.timestamps
    end
  end
end
