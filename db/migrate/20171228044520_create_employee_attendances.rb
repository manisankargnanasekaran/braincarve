class CreateEmployeeAttendances < ActiveRecord::Migration[5.1]
  def change
    create_table :employee_attendances do |t|
      t.references :employee, foreign_key: true
      t.datetime :leave_date
      t.string :reason
      t.datetime :apply_date

      t.timestamps
    end
  end
end
