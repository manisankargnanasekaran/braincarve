class AddDueDateToRoyaltyDetails < ActiveRecord::Migration[5.1]
  def change
    add_column :royalty_details, :due_date, :date
  end
end
