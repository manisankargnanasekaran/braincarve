class CreateEmployeeSalaries < ActiveRecord::Migration[5.1]
  def change
    create_table :employee_salaries do |t|
      t.references :employee, foreign_key: true
      t.decimal :salary_amount
      t.string :account_holder_name
      t.string :account_number
      t.string :ifsc_code
      t.string :bank_name
      t.string :account_type

      t.timestamps
    end
  end
end
