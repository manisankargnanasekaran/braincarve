class Invoice < ApplicationRecord
	has_many :invoice_items, :dependent=>:destroy
	has_one :invoice_payment, :dependent=>:destroy
  	belongs_to :order_request

  	accepts_nested_attributes_for :invoice_items, :reject_if => :all_blank, allow_destroy: true

end
