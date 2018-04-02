class OrderRequestItem < ApplicationRecord
  belongs_to :order_request
  belongs_to :inventory_item

  validates_presence_of :inventory_item_id, :request_qty, :message=> "Required"

end
