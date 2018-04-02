class CreateEmpMonthlySalaries < ActiveRecord::Migration[5.1]
  def change
    create_table :emp_monthly_salaries do |t|
      t.references :employee, foreign_key: true
      t.date :salary_for
      t.integer :no_of_leave, :default => 0
      t.decimal :net_salary

      t.timestamps
    end
  end
end
