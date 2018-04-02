class CreateCompanyRoyaltyDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :company_royalty_details do |t|
      t.references :franchisee, foreign_key: true
      t.float :amount
      t.boolean :royalty_type

      t.timestamps
    end
  end
end
