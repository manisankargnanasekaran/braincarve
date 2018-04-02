class CreateRoyaltyDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :royalty_details do |t|
      t.references :franchisee, foreign_key: true
      t.integer :to_franchisee
      t.float :amount
      t.boolean :royalty_type
      t.boolean :paid_status
      t.datetime :payment_date
      t.string :payment_mode
      t.string :reference_no

      t.timestamps
    end
  end
end
