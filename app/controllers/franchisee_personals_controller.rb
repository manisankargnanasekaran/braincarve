class FranchiseePersonalsController < ApplicationController
  before_action :set_franchisee_personal, only: [:show, :edit, :update, :destroy]

  # GET /franchisee_personals
  # GET /franchisee_personals.json
  def index
    @franchisee_personals = FranchiseePersonal.all
  end

  # GET /franchisee_personals/1
  # GET /franchisee_personals/1.json
  def show
  end

  # GET /franchisee_personals/new
  def new
    @franchisee_personal = FranchiseePersonal.new
  end

  # GET /franchisee_personals/1/edit
  def edit
  end

  # POST /franchisee_personals
  # POST /franchisee_personals.json
  def create
    @franchisee_personal = FranchiseePersonal.new(franchisee_personal_params)

    respond_to do |format|
      if @franchisee_personal.save
        format.html { redirect_to @franchisee_personal, notice: 'Franchisee personal was successfully created.' }
        format.json { render :show, status: :created, location: @franchisee_personal }
      else
        format.html { render :new }
        format.json { render json: @franchisee_personal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /franchisee_personals/1
  # PATCH/PUT /franchisee_personals/1.json
  def update
    respond_to do |format|
      if @franchisee_personal.update(franchisee_personal_params)
        format.html { redirect_to @franchisee_personal, notice: 'Franchisee personal was successfully updated.' }
        format.json { render :show, status: :ok, location: @franchisee_personal }
      else
        format.html { render :edit }
        format.json { render json: @franchisee_personal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /franchisee_personals/1
  # DELETE /franchisee_personals/1.json
  def destroy
    @franchisee_personal.destroy
    respond_to do |format|
      format.html { redirect_to franchisee_personals_url, notice: 'Franchisee personal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_franchisee_personal
      @franchisee_personal = FranchiseePersonal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def franchisee_personal_params
      params.require(:franchisee_personal).permit(:franchisee_id, :first_name, :middle_name, :last_name, :dob, :age, :occupation, :experience, :no_of_owners)
    end
end
