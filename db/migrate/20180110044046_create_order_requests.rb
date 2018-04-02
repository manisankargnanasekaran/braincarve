class CreateOrderRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :order_requests do |t|
      t.date :order_date
      t.references :franchisee, foreign_key: true

      t.timestamps
    end
  end
end
