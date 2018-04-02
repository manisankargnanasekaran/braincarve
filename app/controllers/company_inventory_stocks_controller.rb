class CompanyInventoryStocksController < ApplicationController
  before_action :set_company_inventory_stock, only: [:show, :edit, :update, :destroy]

  # GET /company_inventory_stocks
  # GET /company_inventory_stocks.json
  def index
    @company_inventory_stocks = CompanyInventoryStock.all
  end

  # GET /company_inventory_stocks/1
  # GET /company_inventory_stocks/1.json
  def show
  end

  # GET /company_inventory_stocks/new
  def new
    @company_inventory_stock = CompanyInventoryStock.new
  end

  # GET /company_inventory_stocks/1/edit
  def edit
  end

  # POST /company_inventory_stocks
  # POST /company_inventory_stocks.json
  def create
    @company_inventory_stock = CompanyInventoryStock.new(company_inventory_stock_params)

    respond_to do |format|
      if @company_inventory_stock.save
        format.html { redirect_to @company_inventory_stock, notice: 'Company inventory stock was successfully created.' }
        format.json { render :show, status: :created, location: @company_inventory_stock }
      else
        format.html { render :new }
        format.json { render json: @company_inventory_stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /company_inventory_stocks/1
  # PATCH/PUT /company_inventory_stocks/1.json
  def update
    respond_to do |format|
      if @company_inventory_stock.update(company_inventory_stock_params)
        format.html { redirect_to @company_inventory_stock, notice: 'Company inventory stock was successfully updated.' }
        format.json { render :show, status: :ok, location: @company_inventory_stock }
      else
        format.html { render :edit }
        format.json { render json: @company_inventory_stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /company_inventory_stocks/1
  # DELETE /company_inventory_stocks/1.json
  def destroy
    @company_inventory_stock.destroy
    respond_to do |format|
      format.html { redirect_to company_inventory_stocks_url, notice: 'Company inventory stock was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company_inventory_stock
      @company_inventory_stock = CompanyInventoryStock.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_inventory_stock_params
      params.require(:company_inventory_stock).permit(:inventory_item_id, :available_qty)
    end
end
