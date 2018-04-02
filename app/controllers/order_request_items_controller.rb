class OrderRequestItemsController < ApplicationController
  before_action :set_order_request_item, only: [:show, :edit, :update, :destroy]

  # GET /order_request_items
  # GET /order_request_items.json
  def index
    @order_request_items = OrderRequestItem.all
  end

  # GET /order_request_items/1
  # GET /order_request_items/1.json
  def show
  end

  # GET /order_request_items/new
  def new
    @order_request_item = OrderRequestItem.new
  end

  # GET /order_request_items/1/edit
  def edit
  end

  # POST /order_request_items
  # POST /order_request_items.json
  def create
    @order_request_item = OrderRequestItem.new(order_request_item_params)

    respond_to do |format|
      if @order_request_item.save
        format.html { redirect_to @order_request_item, notice: 'Order request item was successfully created.' }
        format.json { render :show, status: :created, location: @order_request_item }
      else
        format.html { render :new }
        format.json { render json: @order_request_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_request_items/1
  # PATCH/PUT /order_request_items/1.json
  def update
    respond_to do |format|
      if @order_request_item.update(order_request_item_params)
        format.html { redirect_to @order_request_item, notice: 'Order request item was successfully updated.' }
        format.json { render :show, status: :ok, location: @order_request_item }
      else
        format.html { render :edit }
        format.json { render json: @order_request_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_request_items/1
  # DELETE /order_request_items/1.json
  def destroy
    @order_request_item.destroy
    respond_to do |format|
      format.html { redirect_to order_request_items_url, notice: 'Order request item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_request_item
      @order_request_item = OrderRequestItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_request_item_params
      params.require(:order_request_item).permit(:order_request_id, :inventory_item_id, :request_qty, :cost_per_item, :amount)
    end
end
