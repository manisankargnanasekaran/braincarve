class CreateCompanyRoyalties < ActiveRecord::Migration[5.1]
  def change
    create_table :company_royalties do |t|
      t.references :franchisee, foreign_key: true
      t.float :student_royalty
      t.float :franchisee_royalty

      t.timestamps
    end
  end
end
