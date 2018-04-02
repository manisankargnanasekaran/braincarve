class OrderRequest < ApplicationRecord
  has_many :order_request_items, :dependent=>:destroy
  has_one :invoice, :dependent=>:destroy
  belongs_to :franchisee

  validates_presence_of :order_date, :message=> "Required"

  accepts_nested_attributes_for :order_request_items, :reject_if => :all_blank, allow_destroy: true

end
