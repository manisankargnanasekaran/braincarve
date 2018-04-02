class AddRoyaltyTypeToCompanyRoyalties < ActiveRecord::Migration[5.1]
  def change
    add_column :company_royalties, :royalty_type, :boolean
  end
end
