class CreateInstallmentDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :installment_details do |t|
      t.references :franchisee, foreign_key: true
      t.decimal :installment_amount
      t.date :installment_date
      t.string :payment_mode
      t.string :reference_no
      t.boolean :paid_status

      t.timestamps
    end
  end
end
