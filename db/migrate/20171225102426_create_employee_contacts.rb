class CreateEmployeeContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :employee_contacts do |t|
      t.references :employee, foreign_key: true
      t.string :contact_no
      t.string :address
      t.string :country
      t.string :state
      t.string :city
      t.string :pincode

      t.timestamps
    end
  end
end
