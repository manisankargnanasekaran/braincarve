class CreateFranchiseeOwners < ActiveRecord::Migration[5.1]
  def change
    create_table :franchisee_owners do |t|
      t.references :franchisee, foreign_key: true
      t.string :salutation
      t.string :first_name
      t.string :last_name
      t.string :contact_no
      t.string :email_id
      t.string :address
      t.date :dob
      t.integer :age
      t.string :experience
      t.string :occupation
      t.string :state
      t.string :country
    
      t.timestamps
    end
  end
end
