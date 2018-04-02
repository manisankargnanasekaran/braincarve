class CreateEmployeePersonals < ActiveRecord::Migration[5.1]
  def change
    create_table :employee_personals do |t|
      t.references :employee, foreign_key: true
      t.string :gender
      t.boolean :marrital_status
      t.string :nationality
      t.date :date_of_birth
      t.string :blood_group

      t.timestamps
    end
  end
end
