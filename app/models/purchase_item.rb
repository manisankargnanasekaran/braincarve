class PurchaseItem < ApplicationRecord
  belongs_to :purchase
  belongs_to :inventory_item
  validates_presence_of :cost_per_item, :quantity, :message=> "Required"
end
