class AddLevelJoinToStudents < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :level_join, :string
  end
end
