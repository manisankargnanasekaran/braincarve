class InstallmentDetailsController < ApplicationController
  before_action :set_installment_detail, only: [:edit, :update, :destroy]

  # GET /installment_details
  # GET /installment_details.json
  def index
    #@installment_details = InstallmentDetail.all
    @installment_details = InstallmentDetail.all.group_by(&:franchisee_id)
  end

  # GET /installment_details/1
  # GET /installment_details/1.json
  def show
    @franchisee = Franchisee.find(params[:id])
    @installment_detail = InstallmentDetail.where(franchisee_id: params[:id])
    if @installment_detail.present?
      balance = @installment_detail.pluck(:due_balance)
      if balance.include?(0)
          @due_fully_paid = true
      end
    end
    #@installment_detail = InstallmentDetail.where(franchisee_id: params[:id], paid_status: true)
  end

  # GET /installment_details/new
  def new
    @installment_detail = InstallmentDetail.new
    @franchisee = Franchisee.find(params[:format])
    #@franchisee.installment_details.build
    #@installment_detail.build
  end

  # GET /installment_details/1/edit
  def edit
    @franchisee = @installment_detail.franchisee
    #@franchisee.installment_details.build
  end

  # POST /installment_details
  # POST /installment_details.json
  def create
  
    @installment_detail = InstallmentDetail.new(installment_detail_params)

    respond_to do |format|
      if @installment_detail.save
        @franchisee = @installment_detail.franchisee
        #InstallmentDetail.franchisee_royalty(@installment_detail)
        @franchisee.franchisee_agreement.update(no_of_installment: InstallmentDetail.where(franchisee_id: @franchisee.id).count.to_i)
        format.html { redirect_to installment_detail_url(id: @installment_detail.franchisee_id), notice: 'Installment detail was successfully created.' }
        format.json { render :show, status: :created, location: @installment_detail }
      else
        format.html { render :new }
        format.json { render json: @installment_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /installment_details/1
  # PATCH/PUT /installment_details/1.json
  def update
    respond_to do |format|
      if @installment_detail.update(installment_detail_params)
        format.html { redirect_to installment_detail_url(id: @installment_detail.franchisee_id), notice: 'Installment detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @installment_detail }
      else
        format.html { render :edit }
        format.json { render json: @installment_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /installment_details/1
  # DELETE /installment_details/1.json
  def destroy
    @installment_detail.destroy
    @franchisee = @installment_detail.franchisee
    @franchisee.franchisee_agreement.update(no_of_installment: InstallmentDetail.where(franchisee_id: @franchisee.id).count.to_i)
    respond_to do |format|
      format.html { redirect_to installment_detail_url(id: @installment_detail.franchisee_id), notice: 'Installment detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def update_franchisee_due_royalty_payment
    @franchisee_royalty_detail = RoyaltyDetail.find(params[:royalty_detail][:id])
    @franchisee_royalty_detail.update(paid_status: true, payment_date: params[:royalty_detail][:payment_date], payment_mode: params[:royalty_detail][:payment_mode], reference_no: params[:royalty_detail][:reference_no])
    redirect_to pay_status_path    
  end


  def due_royalty_amount
    @immediate_child = Franchisee.where(parent: current_user.franchisee.location)
    @immediate_child_ids = Franchisee.where(parent: current_user.franchisee.location).pluck(:id)   
    next_parent = @immediate_child.pluck(:location)
    until Franchisee.where(parent: next_parent).empty?
      @immediate_child_ids << Franchisee.where(parent: next_parent).pluck(:id)
      next_parent = Franchisee.where(parent: next_parent).pluck(:location)
    end
    @franchisee_royalty_details = InstallmentDetail.where(franchisee_id: @immediate_child_ids.flatten).group_by(&:franchisee_id)
  end


  def franchisee_pay_slip
  
    
  end

  def franchisee_payment_detail
    
  end


  def installment_pay
  
    InstallmentDetail.find(params[:installment_detail][:id]).update(payment_date: params[:installment_detail][:payment_date], payment_mode: params[:installment_detail][:payment_mode], reference_no: params[:installment_detail][:reference_no], paid_status: true)
    @franchisee_id = InstallmentDetail.find(params[:installment_detail][:id]).franchisee_id

    unless InstallmentDetail.find(params[:installment_detail][:id]).is_advance == true
        total_amount = Franchisee.find(@franchisee_id).franchisee_agreement.total_amount_gst
        advance_paid = Franchisee.find(@franchisee_id).franchisee_agreement.advance_amount_gst
        balance_paid = InstallmentDetail.where(franchisee_id: @franchisee_id).where(paid_status: true, is_advance: false).pluck(:installment_amount).sum.to_f
        @final_balance = total_amount - (advance_paid + balance_paid)
        
        Franchisee.find(@franchisee_id).franchisee_agreement.update(balance_amount_gst: @final_balance)
    end

    InstallmentDetail.franchisee_royalty(InstallmentDetail.find(params[:installment_detail][:id]).franchisee, params[:installment_detail][:installment_amount], params[:installment_detail][:payment_date])
    redirect_to royalty_pay_to_company_path                                                                                                                     
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_installment_detail
      @installment_detail = InstallmentDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def installment_detail_params
      params.require(:installment_detail).permit!#(:franchisee_id, :installment_amount, :installment_date)
    end
end
