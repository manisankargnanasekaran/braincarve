class Purchase < ApplicationRecord
	has_many :purchase_items, :dependent => :destroy  
	has_one :payment, :dependent => :destroy
	belongs_to :vendor
	
	validates_presence_of :purchase_date, :vendor_id, :bill_no, :message=> "Required"

	accepts_nested_attributes_for :purchase_items, :reject_if => :all_blank, allow_destroy: true
end
