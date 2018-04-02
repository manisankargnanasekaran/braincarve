class CompanyRoyaltyDetailsController < ApplicationController
  before_action :set_company_royalty_detail, only: [:show, :edit, :update, :destroy]

  # GET /company_royalty_details
  # GET /company_royalty_details.json
  def index
    @company_royalty_details = CompanyRoyaltyDetail.all
  end

  # GET /company_royalty_details/1
  # GET /company_royalty_details/1.json
  def show
  end

  # GET /company_royalty_details/new
  def new
    @company_royalty_detail = CompanyRoyaltyDetail.new
  end

  # GET /company_royalty_details/1/edit
  def edit
  end

  # POST /company_royalty_details
  # POST /company_royalty_details.json
  def create
    @company_royalty_detail = CompanyRoyaltyDetail.new(company_royalty_detail_params)

    respond_to do |format|
      if @company_royalty_detail.save
        format.html { redirect_to @company_royalty_detail, notice: 'Company royalty detail was successfully created.' }
        format.json { render :show, status: :created, location: @company_royalty_detail }
      else
        format.html { render :new }
        format.json { render json: @company_royalty_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /company_royalty_details/1
  # PATCH/PUT /company_royalty_details/1.json
  def update
    respond_to do |format|
      if @company_royalty_detail.update(company_royalty_detail_params)
        format.html { redirect_to @company_royalty_detail, notice: 'Company royalty detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @company_royalty_detail }
      else
        format.html { render :edit }
        format.json { render json: @company_royalty_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /company_royalty_details/1
  # DELETE /company_royalty_details/1.json
  def destroy
    @company_royalty_detail.destroy
    respond_to do |format|
      format.html { redirect_to company_royalty_details_url, notice: 'Company royalty detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def company_royalty_pay_slip
  
  end

  def update_company_royalty_payment
    @company_royalty_detail = CompanyRoyaltyDetail.find(params[:company_royalty_detail][:id])
    @company_royalty_detail.update(paid_status: true, payment_date: params[:company_royalty_detail][:payment_date], payment_mode: params[:company_royalty_detail][:payment_mode], reference_no: params[:company_royalty_detail][:reference_no])
    redirect_to royalty_pay_to_company_path
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company_royalty_detail
      @company_royalty_detail = CompanyRoyaltyDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_royalty_detail_params
      params.require(:company_royalty_detail).permit(:franchisee_id, :amount, :royalty_type)
    end
end
