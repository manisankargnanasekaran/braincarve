class CreateFranchisees < ActiveRecord::Migration[5.1]
  def change
    create_table :franchisees do |t|
      t.integer :franchisee_type      
      t.string :location
      t.string :parent
      t.integer :no_of_owners
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
