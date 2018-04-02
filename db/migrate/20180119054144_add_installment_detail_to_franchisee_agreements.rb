class AddInstallmentDetailToFranchiseeAgreements < ActiveRecord::Migration[5.1]
  def change
    add_column :franchisee_agreements, :installment_detail, :string
    add_column :franchisee_owners, :id_proof, :string
    add_column :franchisee_owners, :id_proof_number, :string
  end
end
