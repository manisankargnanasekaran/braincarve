class EmployeePersonalsController < ApplicationController
  before_action :set_employee_personal, only: [:show, :edit, :update, :destroy]

  # GET /employee_personals
  # GET /employee_personals.json
  def index
    @employee_personals = EmployeePersonal.all
  end

  # GET /employee_personals/1
  # GET /employee_personals/1.json
  def show
  end

  # GET /employee_personals/new
  def new
    @employee_personal = EmployeePersonal.new
  end

  # GET /employee_personals/1/edit
  def edit
  end

  # POST /employee_personals
  # POST /employee_personals.json
  def create
    @employee_personal = EmployeePersonal.new(employee_personal_params)

    respond_to do |format|
      if @employee_personal.save
        format.html { redirect_to @employee_personal, notice: 'Employee personal was successfully created.' }
        format.json { render :show, status: :created, location: @employee_personal }
      else
        format.html { render :new }
        format.json { render json: @employee_personal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employee_personals/1
  # PATCH/PUT /employee_personals/1.json
  def update
    respond_to do |format|
      if @employee_personal.update(employee_personal_params)
        format.html { redirect_to @employee_personal, notice: 'Employee personal was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee_personal }
      else
        format.html { render :edit }
        format.json { render json: @employee_personal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employee_personals/1
  # DELETE /employee_personals/1.json
  def destroy
    @employee_personal.destroy
    respond_to do |format|
      format.html { redirect_to employee_personals_url, notice: 'Employee personal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee_personal
      @employee_personal = EmployeePersonal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_personal_params
      params.require(:employee_personal).permit(:employee_id, :gender, :marrital_status, :nationality, :date_of_birth, :blood_group)
    end
end
