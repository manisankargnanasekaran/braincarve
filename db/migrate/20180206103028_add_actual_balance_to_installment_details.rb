class AddActualBalanceToInstallmentDetails < ActiveRecord::Migration[5.1]
  def change
    add_column :installment_details, :actual_balance, :decimal
  end
end
