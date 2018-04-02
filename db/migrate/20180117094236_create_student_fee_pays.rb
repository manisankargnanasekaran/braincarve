class CreateStudentFeePays < ActiveRecord::Migration[5.1]
  def change
    create_table :student_fee_pays do |t|
      t.float :amount
      t.float :exclude_royalty
      t.string :reference_number
      t.datetime :dated
      t.string :fee_type
      t.string :payer_name
      t.bigint :number_of_classes
      t.belongs_to :student_detail, foreign_key: true
      t.belongs_to :franchisee, foreign_key: true

      t.timestamps
    end
  end
end
