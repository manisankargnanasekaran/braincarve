class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.references :purchase, foreign_key: true
      t.datetime :payment_date
      t.string :payment_mode
      t.string :reference_no
      t.decimal :amount_paid

      t.timestamps
    end
  end
end
