class PaymentsController < ApplicationController
  before_action :set_payment, only: [:show, :edit, :update, :destroy]

  def index
    @payments = Payment.all
  end

  def show
  end

  def new
    @payment = Payment.new
  end
 
  def edit
  end

# For multi[le payment option
  # def create
  #   purchase_id = params[:payment][:purchase_id]
  #   @payment = Payment.new(payment_params)

  #   respond_to do |format|
  #     if @payment.save
  #       @purchase_data = Purchase.find(@payment.purchase_id)
  #       if @amount_to_update == 0
  #         Purchase.find(@payment.purchase_id).update(balance_amount: @amount_to_update, paid_status: true)
  #       else
  #         Purchase.find(@payment.purchase_id).update(balance_amount: @amount_to_update)
  #       end
  #       format.html { redirect_to purchases_url, notice: 'Payment was successfully created.' }
  #       format.json { render :show, status: :created, location: @payment }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @payment.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end


  def create
    purchase_id = params[:payment][:purchase_id]
    @payment = Payment.new(payment_params)

    respond_to do |format|
      if @payment.save
        @purchase_data = Purchase.find(@payment.purchase_id)
        Purchase.find(@payment.purchase_id).update(balance_amount: 0, paid_status: true)
        format.html { redirect_to purchases_url, notice: 'Payment was successfully created.' }
        format.json { render :show, status: :created, location: @payment }
      else
        format.html { render :new }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def update
    respond_to do |format|
      if @payment.update(payment_params)
        format.html { redirect_to @payment, notice: 'Payment was successfully updated.' }
        format.json { render :show, status: :ok, location: @payment }
      else
        format.html { render :edit }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payments/1
  # DELETE /payments/1.json
  def destroy
    @payment.destroy
    respond_to do |format|
      format.html { redirect_to payments_url, notice: 'Payment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_payment
      @payment = Payment.find(params[:id])
    end

    def payment_params
      params.require(:payment).permit(:purchase_id, :payment_date, :payment_mode, :reference_no, :amount_paid)
    end
end
