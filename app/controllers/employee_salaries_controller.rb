class EmployeeSalariesController < ApplicationController
  before_action :set_employee_salary, only: [:show, :edit, :update, :destroy]

  # GET /employee_salaries
  # GET /employee_salaries.json
  def index
    @employee_salaries = EmployeeSalary.all
  end

  # GET /employee_salaries/1
  # GET /employee_salaries/1.json
  def show
  end

  # GET /employee_salaries/new
  def new
    @employee_salary = EmployeeSalary.new
  end

  # GET /employee_salaries/1/edit
  def edit
  end

  # POST /employee_salaries
  # POST /employee_salaries.json
  def create
    @employee_salary = EmployeeSalary.new(employee_salary_params)

    respond_to do |format|
      if @employee_salary.save
        format.html { redirect_to @employee_salary, notice: 'Employee salary was successfully created.' }
        format.json { render :show, status: :created, location: @employee_salary }
      else
        format.html { render :new }
        format.json { render json: @employee_salary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employee_salaries/1
  # PATCH/PUT /employee_salaries/1.json
  def update
    respond_to do |format|
      if @employee_salary.update(employee_salary_params)
        format.html { redirect_to @employee_salary, notice: 'Employee salary was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee_salary }
      else
        format.html { render :edit }
        format.json { render json: @employee_salary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employee_salaries/1
  # DELETE /employee_salaries/1.json
  def destroy
    @employee_salary.destroy
    respond_to do |format|
      format.html { redirect_to employee_salaries_url, notice: 'Employee salary was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee_salary
      @employee_salary = EmployeeSalary.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_salary_params
      params.require(:employee_salary).permit(:employee_id, :salary_amount, :account_holder_name, :account_number, :ifsc_code, :bank_name, :account_type)
    end
end
