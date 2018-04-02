class AddLevelToStudentFeePay < ActiveRecord::Migration[5.1]
  def change
    add_column :student_fee_pays, :level, :string
  end
end
