class AddPaymentModeToStudentFeePays < ActiveRecord::Migration[5.1]
  def change
    add_column :student_fee_pays, :payment_mode, :string
  end
end
