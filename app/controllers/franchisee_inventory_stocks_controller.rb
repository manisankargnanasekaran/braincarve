class FranchiseeInventoryStocksController < ApplicationController
  before_action :set_franchisee_inventory_stock, only: [:show, :edit, :update, :destroy]

  # GET /franchisee_inventory_stocks
  # GET /franchisee_inventory_stocks.json
  def index
    @franchisee_inventory_stocks = FranchiseeInventoryStock.where(franchisee_id: current_user.franchisee.id)
  end

  # GET /franchisee_inventory_stocks/1
  # GET /franchisee_inventory_stocks/1.json
  def show
  end

  # GET /franchisee_inventory_stocks/new
  def new
    @franchisee_inventory_stock = FranchiseeInventoryStock.new
  end

  # GET /franchisee_inventory_stocks/1/edit
  def edit
  end

  # POST /franchisee_inventory_stocks
  # POST /franchisee_inventory_stocks.json
  def create
    @franchisee_inventory_stock = FranchiseeInventoryStock.new(franchisee_inventory_stock_params)

    respond_to do |format|
      if @franchisee_inventory_stock.save
        format.html { redirect_to @franchisee_inventory_stock, notice: 'Franchisee inventory stock was successfully created.' }
        format.json { render :show, status: :created, location: @franchisee_inventory_stock }
      else
        format.html { render :new }
        format.json { render json: @franchisee_inventory_stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /franchisee_inventory_stocks/1
  # PATCH/PUT /franchisee_inventory_stocks/1.json
  def update
    respond_to do |format|
      if @franchisee_inventory_stock.update(franchisee_inventory_stock_params)
        format.html { redirect_to @franchisee_inventory_stock, notice: 'Franchisee inventory stock was successfully updated.' }
        format.json { render :show, status: :ok, location: @franchisee_inventory_stock }
      else
        format.html { render :edit }
        format.json { render json: @franchisee_inventory_stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /franchisee_inventory_stocks/1
  # DELETE /franchisee_inventory_stocks/1.json
  def destroy
    @franchisee_inventory_stock.destroy
    respond_to do |format|
      format.html { redirect_to franchisee_inventory_stocks_url, notice: 'Franchisee inventory stock was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_franchisee_inventory_stock
      @franchisee_inventory_stock = FranchiseeInventoryStock.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def franchisee_inventory_stock_params
      params.require(:franchisee_inventory_stock).permit(:franchisee_id, :inventory_item_id, :available_qty)
    end
end
