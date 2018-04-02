class InventoryItem < ApplicationRecord
	has_one :company_inventory_stock, :dependent => :destroy  
	has_many :purchase_items, :dependent => :destroy  
	has_many :order_request_items, :dependent=>:destroy
	has_many :franchisee_inventory_stocks, :dependent => :destroy

	validates_presence_of :book, :min_quantity, :gst_percentage, :unit, :cost_per_item, :message => "Required"
	#validates :min_quantity, :numericality => {:only_integer => true}
	validates_numericality_of :min_quantity, :gst_percentage, :cost_per_item, :message => "Invalid"

	def order_item_scale
  	 "#{book} - (#{unit})"
  	end

end
