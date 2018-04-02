class AddCreatedByToStudents < ActiveRecord::Migration[5.1]
  def change
    add_reference :students, :created_by, references: :users
    add_reference :batches, :created_by, references: :users
  end
end
