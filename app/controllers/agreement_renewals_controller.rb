class AgreementRenewalsController < ApplicationController
  before_action :set_agreement_renewal, only: [:show, :edit, :update, :destroy]

  # GET /agreement_renewals
  # GET /agreement_renewals.json
  def index
    @agreement_renewals = AgreementRenewal.all
  end

  # GET /agreement_renewals/1
  # GET /agreement_renewals/1.json
  def show
  end

  # GET /agreement_renewals/new
  def new
    @agreement_renewal = AgreementRenewal.new
    @agreement_renewal.franchisee_documents.build 
  end

  # GET /agreement_renewals/1/edit
  def edit
  end

  def form
    @agreement_renewal = AgreementRenewal.new
    @agreement_renewal.build_franchisee_document
  end

  # POST /agreement_renewals
  # POST /agreement_renewals.json
  def create
    @agreement_renewal = AgreementRenewal.new(agreement_renewal_params)

    respond_to do |format|
      if @agreement_renewal.save
        Franchisee.find(@agreement_renewal.franchisee_id).update(latest_renewal: @agreement_renewal.renewed_date)
        format.html { redirect_to franchisees_path, notice: 'Agreement renewal was successfully created.' }
        format.json { render :show, status: :created, location: @agreement_renewal }
      else
        format.html { render :new }
        format.json { render json: @agreement_renewal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /agreement_renewals/1
  # PATCH/PUT /agreement_renewals/1.json
  def update
    respond_to do |format|
      if @agreement_renewal.update(agreement_renewal_params)
        format.html { redirect_to @agreement_renewal, notice: 'Agreement renewal was successfully updated.' }
        format.json { render :show, status: :ok, location: @agreement_renewal }
      else
        format.html { render :edit }
        format.json { render json: @agreement_renewal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /agreement_renewals/1
  # DELETE /agreement_renewals/1.json
  def destroy
    @agreement_renewal.destroy
    respond_to do |format|
      format.html { redirect_to agreement_renewals_url, notice: 'Agreement renewal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_agreement_renewal
      @agreement_renewal = AgreementRenewal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def agreement_renewal_params
      params.require(:agreement_renewal).permit! #(:franchisee_id, :renewed_date, :franchisee_document_id)
    end
end
