class CreateVendors < ActiveRecord::Migration[5.1]
  def change
    create_table :vendors do |t|
      t.string :vendor_name
      t.string :contact_no
      t.string :vendor_address
      t.float :gst_percentage

      t.timestamps
    end
  end
end
