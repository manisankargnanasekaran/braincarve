class FranchiseeInventoryStock < ApplicationRecord
  belongs_to :franchisee
  belongs_to :inventory_item

  def self.franchisee_stock_update_after_invoice(invoice_id)
  	@franchisee_ordered = Invoice.find(invoice_id).order_request.franchisee_id
  	@invoice_items = InvoiceItem.where(:invoice_id=>invoice_id)
  	@invoice_items.map do |each_item|
  		@stock_to_update = FranchiseeInventoryStock.where(franchisee_id: @franchisee_ordered).find_by(inventory_item_id: each_item.inventory_item_id)
  		if @stock_to_update.present?
  			quantity_to_update = @stock_to_update.available_qty + each_item.invoice_qty 
  			@stock_to_update.update(available_qty: quantity_to_update.to_i )	
  		else
  			FranchiseeInventoryStock.create(franchisee_id: @franchisee_ordered, inventory_item_id: each_item.inventory_item_id, available_qty: each_item.invoice_qty)
  	    end
    end
  end

end
