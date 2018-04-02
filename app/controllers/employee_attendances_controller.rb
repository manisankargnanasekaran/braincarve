class EmployeeAttendancesController < ApplicationController
  before_action :set_employee_attendance, only: [:show, :edit, :update, :destroy]
    
  def index
    #@employee_attendances = EmployeeAttendance.all
    @employee_attendances = EmployeeAttendance.where(:employee_id=>params[:id])
  end

  def show
  end

 
  def new
    @employee_attendance = EmployeeAttendance.new
  end

  
  def edit
  end

  
  def create
    # code to create multiple leave entries
    leave_period = params[:leave_period].split(" ")
    employee_id = params[:employee_attendance][:employee_id]
    reason = params[:employee_attendance][:reason]
    @employee_attendance = EmployeeAttendance.create_multiple_leave(leave_period, employee_id, reason)
    respond_to do |format|
      if @employee_attendance.present?
        format.html { redirect_to employee_attendances_url(id: employee_id), notice: 'Employee attendance was successfully created.' }
        format.json { render :show, status: :created, location: @employee_attendance }
      else
        format.html { render :new }
        format.json { render json: @employee_attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def update
    respond_to do |format|
      if @employee_attendance.update(employee_attendance_params)
        format.html { redirect_to @employee_attendance, notice: 'Employee attendance was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee_attendance }
      else
        format.html { render :edit }
        format.json { render json: @employee_attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def destroy
    employee_id = @employee_attendance.employee_id
    @employee_attendance.destroy
    
    EmpMonthlySalary.salary_entry_updation(employee_id)
    respond_to do |format|
      format.html { redirect_to employee_attendances_url(id: employee_id), notice: 'Employee attendance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



  def leave
    @employee_attendance = EmployeeAttendance.new
  end
    

  def monthly_leave
    @employee_absent = EmployeeAttendance.where(:leave_date=>Date.current.beginning_of_month..Date.current.end_of_month).group_by(&:employee_id)
  end


  def get_month_year_leave
    @grouped_leave_record = EmployeeAttendance.all.group_by { |m| [m.leave_date.month, m.leave_date.year]}
    @dynamic_employee_leave = @grouped_leave_record.map{|k,v| k == [params[:month_selected].to_i, params[:year_selected].to_i] ? v : nil}.compact
  end

  private
    
    def set_employee_attendance
      @employee_attendance = EmployeeAttendance.find(params[:id])
    end

    
    def employee_attendance_params
      params.require(:employee_attendance).permit!#(:employee_id, :start_date, :end_date, :day_count, :reason)
    end
end
