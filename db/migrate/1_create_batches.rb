class CreateBatches < ActiveRecord::Migration[5.1]
  def change
    create_table :batches do |t|
      t.string :batch_no
      t.string :day
      t.string :batch_time
      t.string :duration_in_hours
      t.string :batch_end_time
      t.string :duration_in_minutes
      t.timestamps
      
    end
  end
end
