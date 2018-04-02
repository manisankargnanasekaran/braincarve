class CompanyInventoryStock < ApplicationRecord
  belongs_to :inventory_item

  def self.company_stock_update_after_invoice(invoice_id)
  	@invoice_items = InvoiceItem.where(:invoice_id=>invoice_id)
  	@invoice_items.map do |each_item|
  		quantity_to_update = CompanyInventoryStock.find_by(inventory_item_id: each_item.inventory_item_id).available_qty - each_item.invoice_qty 
  		CompanyInventoryStock.find_by(inventory_item_id: each_item.inventory_item_id).update(available_qty: quantity_to_update.to_i )
    end
  end

end
