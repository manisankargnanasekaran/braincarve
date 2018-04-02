class AddDueBalanceToInstallmentDetails < ActiveRecord::Migration[5.1]
  def change
    add_column :installment_details, :due_balance, :decimal
    add_column :employees, :resume, :string
   	add_reference :purchases, :vendor, references: :vendors
  end
end
