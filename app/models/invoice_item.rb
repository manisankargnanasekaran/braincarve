class InvoiceItem < ApplicationRecord
  belongs_to :invoice
  belongs_to :inventory_item
end
