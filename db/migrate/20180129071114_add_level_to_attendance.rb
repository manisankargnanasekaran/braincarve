class AddLevelToAttendance < ActiveRecord::Migration[5.1]
  def change
    add_column :attendances, :level, :string
  end
end
