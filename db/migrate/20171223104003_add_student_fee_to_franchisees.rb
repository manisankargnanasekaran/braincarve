class AddStudentFeeToFranchisees < ActiveRecord::Migration[5.1]
  def change
    add_column :franchisees, :student_fee, :decimal
  end
end
