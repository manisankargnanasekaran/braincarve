class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]

  # GET /invoices
  # GET /invoices.json
  def index
    #@invoices = Invoice.all
    @order_requests = OrderRequest.all
  end

  # GET /invoices/1
  # GET /invoices/1.json
  def show
  end

  # GET /invoices/new
  def new
    @order = OrderRequest.find(params[:id])
    @order_items = OrderRequest.find(params[:id]).order_request_items
    @item_count = OrderRequest.find(params[:id]).order_request_items.count
    @invoice = Invoice.new
    #@invoice.invoice_items.build
  end

  # GET /invoices/1/edit
  def edit
      #@invoice.invoice_items.build
  end

  # POST /invoices
  # POST /invoices.json
  def create
    @order_request = params[:invoice][:order_request_id]
    @user = OrderRequest.find(params[:invoice][:order_request_id]).franchisee.user.id
    params[:invoice][:total_amount] = params[:total_cost]
    params[:invoice][:balance_amount] = params[:total_cost]
    params[:invoice][:paid_status] = false
    @invoice_items = params[:invoice_items]

    @invoice = Invoice.new(invoice_params)

    respond_to do |format|
      if @invoice.save
        @invoice_items.map do |invoice|
            InvoiceItem.create(invoice_id: @invoice.id, inventory_item_id: InventoryItem.find_by(book: invoice[:item]).id, invoice_qty: invoice[:quantity], cost_per_item: invoice[:cost_per_unit], amount: invoice[:total_cost])
            OrderRequestItem.where(order_request_id: params[:invoice][:order_request_id]).find_by(inventory_item_id: InventoryItem.find_by(book: invoice[:item]).id).update(request_qty: invoice[:quantity], cost_per_item: invoice[:cost_per_unit], amount: invoice[:total_cost])
        end
        InvoiceNotifierMailer.send_invoice(@user, @order_request).deliver_now!
        format.html { redirect_to invoices_url, notice: 'Invoice was successfully created.' }
        format.json { render :show, status: :created, location: @invoice }
      else
        format.html { render :new }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoices/1
  # PATCH/PUT /invoices/1.json
  def update
    respond_to do |format|
      if @invoice.update(invoice_params)
        format.html { redirect_to @invoice, notice: 'Invoice was successfully updated.' }
        format.json { render :show, status: :ok, location: @invoice }
      else
        format.html { render :edit }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.json
  def destroy
    @invoice.destroy
    respond_to do |format|
      format.html { redirect_to invoices_url, notice: 'Invoice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def invoice_pay_slip
    
  end

  def invoice_payment_detail
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
      @invoice = Invoice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invoice_params
      params.require(:invoice).permit!#(:invoice_date, :order_request_id, :total_amount, :balance_amount, :paid_status)
    end
end
