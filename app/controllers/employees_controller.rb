class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]

 
  def index
    @employees = Employee.all
  end

  
  def show
  end

  
  def new
    @employee = Employee.new
    @employee.build_employee_salary
    @employee.build_employee_personal
    @employee.build_employee_contact
    @employee.build_profile_image
  end

  
  def edit 
    @employee.build_profile_image
  end

  
  def create
    date_of_joining = params[:employee][:date_of_joining]
    salary_amount = params[:employee][:employee_salary_attributes][:salary_amount]
    @employee = Employee.new(employee_params)
    respond_to do |format|
      if @employee.save
        Employee.create_leave_entry(@employee.id, date_of_joining)
        Employee.create_salary_entry(@employee.id, date_of_joining, salary_amount)
        format.html { redirect_to employees_url, notice: 'Employee was successfully created.' }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to employees_url, notice: 'Employee was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'Employee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    
    def set_employee
      @employee = Employee.find(params[:id])
    end

    
    def employee_params
      params.require(:employee).permit!#(:employee_identity, :prefix, :first_name, :last_name, :email_id, :department, :job_title, :date_of_joining)
    end
end
