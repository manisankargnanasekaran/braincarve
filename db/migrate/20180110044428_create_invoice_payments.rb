class CreateInvoicePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :invoice_payments do |t|
      t.references :invoice, foreign_key: true
      t.date :payment_date
      t.string :payment_mode
      t.string :reference_no
      t.decimal :amount_paid

      t.timestamps
    end
  end
end
