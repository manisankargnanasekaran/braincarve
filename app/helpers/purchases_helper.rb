module PurchasesHelper

  def	inventory_items
  	InventoryItem.all
  end

  def payment_mode_list
  	['Cash', 'Cheque', 'D.D', 'Online']
  end

end
