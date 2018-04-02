class CreateStudentDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :student_details do |t|
      t.references :student, foreign_key: true
      t.string :father_name
      t.string :father_occupation
      t.string :father_email
      t.string :father_contact_no
      t.string :mother_name
      t.string :mother_occupation
      t.string :mother_email
      t.string :mother_contact_no
      t.string :known_by
      t.string :reason_to_enroll

      t.timestamps
    end
  end
end
