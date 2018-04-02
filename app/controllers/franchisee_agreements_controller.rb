class FranchiseeAgreementsController < ApplicationController
  before_action :set_franchisee_agreement, only: [:show, :edit, :update, :destroy]

  # GET /franchisee_agreements
  # GET /franchisee_agreements.json
  def index
    @franchisee_agreements = FranchiseeAgreement.all
  end

  # GET /franchisee_agreements/1
  # GET /franchisee_agreements/1.json
  def show
  end

  # GET /franchisee_agreements/new
  def new
    @franchisee_agreement = FranchiseeAgreement.new
  end

  # GET /franchisee_agreements/1/edit
  def edit
  end

  # POST /franchisee_agreements
  # POST /franchisee_agreements.json
  def create
    @franchisee_agreement = FranchiseeAgreement.new(franchisee_agreement_params)

    respond_to do |format|
      if @franchisee_agreement.save
        format.html { redirect_to @franchisee_agreement, notice: 'Franchisee agreement was successfully created.' }
        format.json { render :show, status: :created, location: @franchisee_agreement }
      else
        format.html { render :new }
        format.json { render json: @franchisee_agreement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /franchisee_agreements/1
  # PATCH/PUT /franchisee_agreements/1.json
  def update
    respond_to do |format|
      if @franchisee_agreement.update(franchisee_agreement_params)
        format.html { redirect_to @franchisee_agreement, notice: 'Franchisee agreement was successfully updated.' }
        format.json { render :show, status: :ok, location: @franchisee_agreement }
      else
        format.html { render :edit }
        format.json { render json: @franchisee_agreement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /franchisee_agreements/1
  # DELETE /franchisee_agreements/1.json
  def destroy
    @franchisee_agreement.destroy
    respond_to do |format|
      format.html { redirect_to franchisee_agreements_url, notice: 'Franchisee agreement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_franchisee_agreement
      @franchisee_agreement = FranchiseeAgreement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def franchisee_agreement_params
      params.require(:franchisee_agreement).permit(:franchisee_id, :agreement_date, :duration, :renewal_date, :location, :no_of_centers, :advance_amount_gst, :balance_amount_gst, :no_of_installment, :center_address, :city, :state, :pincode)
    end
end
