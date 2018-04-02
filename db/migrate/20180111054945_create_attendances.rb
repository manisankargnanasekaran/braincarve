class CreateAttendances < ActiveRecord::Migration[5.1]
  def change
    create_table :attendances do |t|
      t.integer :attend_class
      t.string :date
      t.boolean :payment_status
      t.belongs_to :student, foreign_key: true

      t.timestamps
    end
  end
end
