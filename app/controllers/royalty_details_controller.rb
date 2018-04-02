class RoyaltyDetailsController < ApplicationController
  before_action :set_royalty_detail, only: [:show, :edit, :update, :destroy]

  # GET /royalty_details
  # GET /royalty_details.json
  def index
    @royalty_details = RoyaltyDetail.all
  end

  def royalty
    #byebug
   
    @royalty_details = RoyaltyDetail.where(royalty_type:true).group(:to_franchisee, :franchisee_id).order("sum_amount").sum(:amount)
    @royalty_details_1 = CompanyRoyaltyDetail.where(royalty_type:true).group(:franchisee_id).order("sum_amount").sum(:amount)
    @royalty_details_2 = RoyaltyDetail.where(royalty_type:false).group(:to_franchisee, :franchisee_id).order("sum_amount").sum(:amount)
    @royalty_details_3 = CompanyRoyaltyDetail.where(royalty_type:false).group(:franchisee_id).order("sum_amount").sum(:amount)
  end

  # def company
  #   @royalty_details1 = CompanyRoyaltyDetail.group(:franchisee_id).order("sum_amount").sum(:amount)
  # end

  # def franchisee_royalty
  #   short_franchisee = RoyaltyDetail.where(to_franchisee: current_user.franchisee.id)
  #   @royalty_details = short_franchisee.group(:to_franchisee, :franchisee_id).order("sum_amount").sum(:amount)
  # end

  # GET /royalty_details/1
  # GET /royalty_details/1.json
  def show
  end

  # GET /royalty_details/new
  def new
    @royalty_detail = RoyaltyDetail.new
  end

  # GET /royalty_details/1/edit
  def edit
  end

  # POST /royalty_details
  # POST /royalty_details.json
  def create
    @royalty_detail = RoyaltyDetail.new(royalty_detail_params)

    respond_to do |format|
      if @royalty_detail.save
        format.html { redirect_to @royalty_detail, notice: 'Royalty detail was successfully created.' }
        format.json { render :show, status: :created, location: @royalty_detail }
      else
        format.html { render :new }
        format.json { render json: @royalty_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /royalty_details/1
  # PATCH/PUT /royalty_details/1.json
  def update
    respond_to do |format|
      if @royalty_detail.update(royalty_detail_params)
        format.html { redirect_to @royalty_detail, notice: 'Royalty detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @royalty_detail }
      else
        format.html { render :edit }
        format.json { render json: @royalty_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /royalty_details/1
  # DELETE /royalty_details/1.json
  def destroy
    @royalty_detail.destroy
    respond_to do |format|
      format.html { redirect_to royalty_details_url, notice: 'Royalty detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def current_month_royalty 
     @royalty_details = RoyaltyDetail.where(:created_at=>Date.current.beginning_of_month..Date.current.end_of_month, royalty_type: true).where(to_franchisee: current_user.franchisee.id).group_by(&:franchisee_id)
     short_franchisee = RoyaltyDetail.where(to_franchisee: current_user.franchisee.id, royalty_type: true)
     @royalty_details_1 = short_franchisee.group(:to_franchisee, :franchisee_id).order("sum_amount").sum(:amount)
  end

  def get_month_year_franchisee_child_royalty
    @grouped_franchisee_child_royalty = RoyaltyDetail.where(to_franchisee: current_user.franchisee.id, royalty_type: true).group_by { |m| [m.created_at.month, m.created_at.year]}
    @dynamic_franchisee_child_royalty = @grouped_franchisee_child_royalty.map{|k,v| k == [params[:month_selected].to_i, params[:year_selected].to_i] ? v : nil}.compact
  end

  def current_month_company_royalty 
     @royalty_details = CompanyRoyaltyDetail.where(:created_at=>Date.current.beginning_of_month..Date.current.end_of_month).group_by(&:franchisee_id)
  end

   def get_month_year_company_royalty
    @grouped_company_royalty = CompanyRoyaltyDetail.all.group_by { |m| [m.created_at.month, m.created_at.year]}
    @dynamic_company_royalty = @grouped_company_royalty.map{|k,v| k == [params[:month_selected].to_i, params[:year_selected].to_i] ? v : nil}.compact
   end

   def pay_status 
      @royalty_details = RoyaltyDetail.where(to_franchisee: current_user.franchisee.id, royalty_type: true)
      @franchisee_royalty_details = RoyaltyDetail.where(to_franchisee: current_user.franchisee.id, royalty_type: false)
   end

   def our_pay_status 
      @royalty_details = RoyaltyDetail.where(franchisee_id: current_user.franchisee.id, royalty_type: true)
      @royalty_details_1 = CompanyRoyaltyDetail.where(franchisee_id: current_user.franchisee.id, royalty_type: true)
      @royalty_details_2 = RoyaltyDetail.where(franchisee_id: current_user.franchisee.id, royalty_type: false)
      @royalty_details_3 = CompanyRoyaltyDetail.where(franchisee_id: current_user.franchisee.id, royalty_type: false)
      @installment_details = InstallmentDetail.where(franchisee_id: current_user.franchisee.id, is_advance: false)
   end


   # def change_status_true
   #  RoyaltyDetail.find(params[:id]).update(paid_status: false)
   #  redirect_to pay_status_path
   # end

   # def change_status_false
   #  RoyaltyDetail.find(params[:id]).update(paid_status: true)
   #  redirect_to pay_status_path
   # end

   # def our_company_pay
   #   @royalty_details = CompanyRoyaltyDetail.where(franchisee_id: current_user.franchisee.id)
   # end

   def royalty_pay_to_company
    @royalty_details = CompanyRoyaltyDetail.where(royalty_type: true)
    @installment_details = InstallmentDetail.all.group_by(&:franchisee_id)
   end
    
   # def pay_status_updation
   #    CompanyRoyaltyDetail.find(params[:id]).update(paid_status: true)
   #    redirect_to royalty_pay_to_company_path
   # end 
   


  def franchisee_royalty_pay_slip
  
  end

  def update_franchisee_royalty_payment
      @franchisee_royalty_detail = RoyaltyDetail.find(params[:royalty_detail][:id])
      @franchisee_royalty_detail.update(paid_status: true, payment_date: params[:royalty_detail][:payment_date], payment_mode: params[:royalty_detail][:payment_mode], reference_no: params[:royalty_detail][:reference_no])
      redirect_to pay_status_path
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_royalty_detail
      @royalty_detail = RoyaltyDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def royalty_detail_params
      params.require(:royalty_detail).permit!#(:franchisee_id, :to_franchisee, :amount, :royalty_type)
    end
end
