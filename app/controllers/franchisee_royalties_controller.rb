class FranchiseeRoyaltiesController < ApplicationController
  before_action :set_franchisee_royalty, only: [:show, :edit, :update, :destroy]

  # GET /franchisee_royalties
  # GET /franchisee_royalties.json
  def index
    @franchisee_royalties = FranchiseeRoyalty.all
  end

  # GET /franchisee_royalties/1
  # GET /franchisee_royalties/1.json
  def show
  end

  # GET /franchisee_royalties/new
  def new
    @franchisee_royalty = FranchiseeRoyalty.new
  end

  # GET /franchisee_royalties/1/edit
  def edit
  end

  # POST /franchisee_royalties
  # POST /franchisee_royalties.json
  def create
    @franchisee_royalty = FranchiseeRoyalty.new(franchisee_royalty_params)

    respond_to do |format|
      if @franchisee_royalty.save
        format.html { redirect_to @franchisee_royalty, notice: 'Franchisee royalty was successfully created.' }
        format.json { render :show, status: :created, location: @franchisee_royalty }
      else
        format.html { render :new }
        format.json { render json: @franchisee_royalty.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /franchisee_royalties/1
  # PATCH/PUT /franchisee_royalties/1.json
  def update
    respond_to do |format|
      if @franchisee_royalty.update(franchisee_royalty_params)
        format.html { redirect_to @franchisee_royalty, notice: 'Franchisee royalty was successfully updated.' }
        format.json { render :show, status: :ok, location: @franchisee_royalty }
      else
        format.html { render :edit }
        format.json { render json: @franchisee_royalty.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /franchisee_royalties/1
  # DELETE /franchisee_royalties/1.json
  def destroy
    @franchisee_royalty.destroy
    respond_to do |format|
      format.html { redirect_to franchisee_royalties_url, notice: 'Franchisee royalty was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_franchisee_royalty
      @franchisee_royalty = FranchiseeRoyalty.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def franchisee_royalty_params
      params.require(:franchisee_royalty).permit(:franchisee_id, :to_franchisee, :student_royalty, :franchisee_royalty)
    end
end
