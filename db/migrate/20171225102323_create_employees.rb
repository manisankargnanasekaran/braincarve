class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      t.string :employee_identity
      t.string :prefix
      t.string :first_name
      t.string :last_name
      t.string :email_id
      t.string :department
      t.string :job_title
      t.date :date_of_joining

      t.timestamps
    end
  end
end
