class AddPaymentTypeToCompanyRoyaltyDetails < ActiveRecord::Migration[5.1]
  def change
    add_column :company_royalty_details, :paid_status, :boolean
    add_column :company_royalty_details, :payment_date, :datetime
    add_column :company_royalty_details, :payment_mode, :string
    add_column :company_royalty_details, :reference_no, :string
    
  end
end
