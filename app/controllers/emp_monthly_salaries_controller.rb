class EmpMonthlySalariesController < ApplicationController
  before_action :set_emp_monthly_salary, only: [:show, :edit, :update, :destroy]

  # GET /emp_monthly_salaries
  # GET /emp_monthly_salaries.json
  def index
    #@all_employees = Employee.all
    @emp_monthly_salaries = EmpMonthlySalary.where(:salary_for=>Date.current.beginning_of_month..Date.current.end_of_month)
  end

  # GET /emp_monthly_salaries/1
  # GET /emp_monthly_salaries/1.json
  def show
  end

  # GET /emp_monthly_salaries/new
  def new
    @emp_monthly_salary = EmpMonthlySalary.new
  end

  # GET /emp_monthly_salaries/1/edit
  def edit
  end

  # POST /emp_monthly_salaries
  # POST /emp_monthly_salaries.json
  def create
    @emp_monthly_salary = EmpMonthlySalary.new(emp_monthly_salary_params)

    respond_to do |format|
      if @emp_monthly_salary.save
        format.html { redirect_to @emp_monthly_salary, notice: 'Emp monthly salary was successfully created.' }
        format.json { render :show, status: :created, location: @emp_monthly_salary }
      else
        format.html { render :new }
        format.json { render json: @emp_monthly_salary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /emp_monthly_salaries/1
  # PATCH/PUT /emp_monthly_salaries/1.json
  def update
    respond_to do |format|
      if @emp_monthly_salary.update(emp_monthly_salary_params)
        format.html { redirect_to @emp_monthly_salary, notice: 'Emp monthly salary was successfully updated.' }
        format.json { render :show, status: :ok, location: @emp_monthly_salary }
      else
        format.html { render :edit }
        format.json { render json: @emp_monthly_salary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /emp_monthly_salaries/1
  # DELETE /emp_monthly_salaries/1.json
  def destroy
    @emp_monthly_salary.destroy
    respond_to do |format|
      format.html { redirect_to emp_monthly_salaries_url, notice: 'Emp monthly salary was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def get_month_year_salary
    @grouped_salary_record = EmpMonthlySalary.all.group_by { |m| [m.salary_for.month, m.salary_for.year]}
    @dynamic_employee_salary = @grouped_salary_record.map{|k,v| k == [params[:month_selected].to_i, params[:year_selected].to_i] ? v : nil}.compact
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_emp_monthly_salary
      @emp_monthly_salary = EmpMonthlySalary.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def emp_monthly_salary_params
      params.require(:emp_monthly_salary).permit(:employee_id, :salary_for, :no_of_leave, :net_salary)
    end
end
