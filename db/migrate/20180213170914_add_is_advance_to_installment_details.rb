class AddIsAdvanceToInstallmentDetails < ActiveRecord::Migration[5.1]
  def change
    add_column :installment_details, :is_advance, :boolean, default: false
  end
end
