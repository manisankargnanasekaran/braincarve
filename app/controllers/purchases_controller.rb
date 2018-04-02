class PurchasesController < ApplicationController
  before_action :set_purchase, only: [:show, :edit, :update, :destroy]

  
  def index
    @purchases = Purchase.all
  end

  
  def show
  end

  
  def new
    @purchase = Purchase.new
    @purchase.purchase_items.build
  end

  
  def edit
    @purchase.purchase_items.build
  end


  def create
    params[:purchase][:paid_status] = false
    params[:purchase][:total_amount] = params[:total_cost]
    params[:purchase][:balance_amount] = params[:total_cost]
    @purchase = Purchase.new(purchase_params)
    respond_to do |format|
        if @purchase.save
          params[:inventory].map do|item|
            if item[:item_id] && item[:quantity].present?
                @purchase_item = PurchaseItem.create(purchase_id: @purchase.id, inventory_item_id: item[:item_id], cost_per_item: item[:cost_per_unit], quantity: item[:quantity], amount_without_gst: item[:quantity].to_i * item[:cost_per_unit].to_f, amount_with_gst: item[:total_cost])
                @purchase_item.save
                @inventory_stock = CompanyInventoryStock.find_by(inventory_item_id: @purchase_item.inventory_item_id)
                @inventory_stock.update(available_qty: @inventory_stock.available_qty.to_i + @purchase_item.quantity.to_i )
            end
          end
          format.html { redirect_to purchases_url, notice: 'Purchase was successfully created.' }
          format.json { render :show, status: :created, location: @purchase }
        else
          format.html { render :new }
          format.json { render json: @purchase.errors, status: :unprocessable_entity }
        end
    end
  end


# older code to create purchase and purchase_item data using nested form
  # def create

  #   params[:purchase][:paid_status] = false
  #   params[:purchase][:balance_amount] = params[:purchase][:total_amount]
   
  #   @purchase = Purchase.new(purchase_params)

  #   respond_to do |format|
  #     if @purchase.save
  #       @purchase.purchase_items.map do |item| 
  #         @quantity_to_update = PurchaseItem.where(inventory_item_id: item.inventory_item_id).map{|i| i.quantity.to_i}.sum
  #         CompanyInventoryStock.find_by(inventory_item_id:item.inventory_item_id).update(available_qty: @quantity_to_update)
  #       end
  #       format.html { redirect_to purchases_url, notice: 'Purchase was successfully created.' }
  #       format.json { render :show, status: :created, location: @purchase }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @purchase.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

 
  def update
    respond_to do |format|
      if @purchase.update(purchase_params)
        format.html { redirect_to purchases_url, notice: 'Purchase was successfully updated.' }
        format.json { render :show, status: :ok, location: @purchase }
      else
        format.html { render :edit }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy 
    @purchase_items = @purchase.purchase_items
    @purchase_items.map do |item|
       @inventory_stock = CompanyInventoryStock.find_by(inventory_item_id: item.inventory_item_id)
        @inventory_stock.update(available_qty: @inventory_stock.available_qty.to_i - item.quantity.to_i )
    end
    @purchase.destroy
    respond_to do |format|
      format.html { redirect_to purchases_url, notice: 'Purchase was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def item_check
    inventory_item = InventoryItem.find(params[:item_id])
    render json: { inventory_item: inventory_item.as_json }
  end

#automatic amount calculation for purchase_items older code

  # def amount_calculation
  #   @amount_without_gst = params[:quantity].to_i * params[:itemCost].to_f 
  #   @gst_of_item = InventoryItem.find(params[:inventoryItem]).gst_percentage.to_f
  #   @unit_of_item = InventoryItem.find(params[:inventoryItem]).unit
  #   @amount_with_gst = @amount_without_gst + ((@gst_of_item / 100) * @amount_without_gst)
  #   @total_purchase_amount = params[:totalPurchaseAmount].to_f + @amount_with_gst
  # end

  def pay_slip
    
  end

  def payment_detail

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase
      @purchase = Purchase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def purchase_params
      params.require(:purchase).permit!#(:purchase_date, :vendor_name, :paid_status, :bill_no, :total_amount, :balance_amount)
    end

end
