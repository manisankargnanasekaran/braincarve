class AddColumnsToFranchiseeRoyalty < ActiveRecord::Migration[5.1]
  def change
    add_column :franchisee_royalties, :franchisee_nf_royalty, :float
    add_column :franchisee_royalties, :franchisee_mf_royalty, :float
    add_column :franchisee_royalties, :franchisee_df_royalty, :float
    add_column :franchisee_royalties, :franchisee_uf_royalty, :float
  end
end
