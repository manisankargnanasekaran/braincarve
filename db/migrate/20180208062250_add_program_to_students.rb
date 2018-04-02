class AddProgramToStudents < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :program, :string
    add_column :franchisees, :latest_renewal, :date
    add_column :installment_details, :payment_date, :date
  end
end
