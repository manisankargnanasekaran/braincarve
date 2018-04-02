class CreateFranchiseeAgreements < ActiveRecord::Migration[5.1]
  def change
    create_table :franchisee_agreements do |t|
      t.references :franchisee, foreign_key: true
      t.date :agreement_date
      t.integer :duration_in_month
      t.date :renewal_date
      t.string :location
      t.integer :no_of_centers
      t.decimal :amount
      t.float :gst
      t.decimal :total_amount_gst
      t.decimal :advance_amount_gst
      t.decimal :balance_amount_gst
      t.integer :no_of_installment
      t.string :center_address
      t.string :city
      t.string :state
      t.string :pincode
      
      t.timestamps
    end
  end
end
