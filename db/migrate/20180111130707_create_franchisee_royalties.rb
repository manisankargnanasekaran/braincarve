class CreateFranchiseeRoyalties < ActiveRecord::Migration[5.1]
  def change
    create_table :franchisee_royalties do |t|
      t.references :franchisee, foreign_key: true
      t.integer :to_nf
      t.integer :to_mf
      t.integer :to_df
      t.integer :to_uf
      t.float :student_nf_royalty
      t.float :student_mf_royalty
      t.float :student_df_royalty
      t.float :student_uf_royalty
      t.float :franchisee_royalty

      t.timestamps
    end
  end
end
