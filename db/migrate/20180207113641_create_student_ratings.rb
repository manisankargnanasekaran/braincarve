class CreateStudentRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :student_ratings do |t|
      t.belongs_to :attendance, foreign_key: true
      t.string :particular
      t.integer :student_rating
      t.string :comment

      t.timestamps
    end
  end
end
