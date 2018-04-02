class InvoicePaymentsController < ApplicationController
  before_action :set_invoice_payment, only: [:show, :edit, :update, :destroy]

  # GET /invoice_payments
  # GET /invoice_payments.json
  def index
    @invoice_payments = InvoicePayment.all
  end

  # GET /invoice_payments/1
  # GET /invoice_payments/1.json
  def show
  end

  # GET /invoice_payments/new
  def new
    @invoice_payment = InvoicePayment.new
  end

  # GET /invoice_payments/1/edit
  def edit
  end

  # POST /invoice_payments
  # POST /invoice_payments.json
  def create
    invoice_id = params[:invoice_payment][:invoice_id]
    @invoice_payment = InvoicePayment.new(invoice_payment_params)

    respond_to do |format|
      if @invoice_payment.save
        @invoice_data = Invoice.find(@invoice_payment.invoice_id)
        Invoice.find(@invoice_payment.invoice_id).update(balance_amount: 0, paid_status: true)
        CompanyInventoryStock.company_stock_update_after_invoice(invoice_id)
        FranchiseeInventoryStock.franchisee_stock_update_after_invoice(invoice_id)
        format.html { redirect_to invoices_url, notice: 'Invoice payment was successfully created.' }
        format.json { render :show, status: :created, location: @invoice_payment }
      else
        format.html { render :new }
        format.json { render json: @invoice_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoice_payments/1
  # PATCH/PUT /invoice_payments/1.json
  def update
    respond_to do |format|
      if @invoice_payment.update(invoice_payment_params)
        format.html { redirect_to invoices_url, notice: 'Invoice payment was successfully updated.' }
        format.json { render :show, status: :ok, location: @invoice_payment }
      else
        format.html { render :edit }
        format.json { render json: @invoice_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoice_payments/1
  # DELETE /invoice_payments/1.json
  def destroy
    @invoice_payment.destroy
    respond_to do |format|
      format.html { redirect_to invoice_payments_url, notice: 'Invoice payment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice_payment
      @invoice_payment = InvoicePayment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invoice_payment_params
      params.require(:invoice_payment).permit(:invoice_id, :payment_date, :payment_mode, :reference_no, :amount_paid)
    end
end
