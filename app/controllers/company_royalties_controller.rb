class CompanyRoyaltiesController < ApplicationController
  before_action :set_company_royalty, only: [:show, :edit, :update, :destroy]

  # GET /company_royalties
  # GET /company_royalties.json
  def index
    @company_royalties = CompanyRoyalty.all
  end

  # GET /company_royalties/1
  # GET /company_royalties/1.json
  def show
  end

  # GET /company_royalties/new
  def new
    @company_royalty = CompanyRoyalty.new
  end

  # GET /company_royalties/1/edit
  def edit
  end

  # POST /company_royalties
  # POST /company_royalties.json
  def create
    @company_royalty = CompanyRoyalty.new(company_royalty_params)

    respond_to do |format|
      if @company_royalty.save
        format.html { redirect_to @company_royalty, notice: 'Company royalty was successfully created.' }
        format.json { render :show, status: :created, location: @company_royalty }
      else
        format.html { render :new }
        format.json { render json: @company_royalty.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /company_royalties/1
  # PATCH/PUT /company_royalties/1.json
  def update
    respond_to do |format|
      if @company_royalty.update(company_royalty_params)
        format.html { redirect_to @company_royalty, notice: 'Company royalty was successfully updated.' }
        format.json { render :show, status: :ok, location: @company_royalty }
      else
        format.html { render :edit }
        format.json { render json: @company_royalty.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /company_royalties/1
  # DELETE /company_royalties/1.json
  def destroy
    @company_royalty.destroy
    respond_to do |format|
      format.html { redirect_to company_royalties_url, notice: 'Company royalty was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company_royalty
      @company_royalty = CompanyRoyalty.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_royalty_params
      params.require(:company_royalty).permit(:franchisee_id, :student_royalty, :franchisee_royalty)
    end
end
