class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :student_name
      t.date :dob
      t.integer :age
      t.integer :gender
      t.string :student_class
      t.string :address
      t.string :contact_no
      t.string :school_name
      t.string :school_location
      t.date :registration_date
      t.references :batch, foreign_key: true
      t.string :level
      t.integer :current_level
      t.boolean :student_active
      t.timestamps
    end
  end
end
