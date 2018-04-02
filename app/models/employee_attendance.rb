class EmployeeAttendance < ApplicationRecord
  belongs_to :employee

  validates_presence_of :leave_date, :message => "Required"


  def self.create_multiple_leave(leave_period, employee_id, reason)
  	
  	start_date = leave_period[0].to_date if leave_period[0]
    end_date = leave_period[2].to_date if leave_period[2]
    leave_dates = start_date..end_date
    
    @employee_attendance = leave_dates.map{|i| EmployeeAttendance.create(:leave_date=>i, :employee_id=>employee_id, :apply_date=>Date.today, :reason=>reason)}
    
    leave_count = EmployeeAttendance.where(:employee_id=>employee_id, :leave_date=>Date.current.beginning_of_month..Date.current.end_of_month).count

    actual_salary = Employee.find(employee_id).employee_salary.salary_amount

    current_month_days = (Date.current.beginning_of_month..Date.current.end_of_month).count

    salary_per_day = (actual_salary / current_month_days).round
    calculated_salary = actual_salary - (salary_per_day * leave_count.to_i)

    @entry_to_update = EmpMonthlySalary.where(:salary_for=>Date.current.beginning_of_month..Date.current.end_of_month).find_by(:employee_id=>employee_id)

    EmpMonthlySalary.where(:salary_for=>Date.current.beginning_of_month..Date.current.end_of_month).find_by(:employee_id=>employee_id).update(:no_of_leave=>leave_count, :net_salary=>calculated_salary.round) if @entry_to_update

    return @employee_attendance
  end

end


# leave_count = EmployeeAttendance.where(:employee_id=>1, :leave_date=>Date.current.beginning_of_month..Date.current.end_of_month).count
# actual_salary = Employee.find(1).employee_salary.salary_amount
# current_month_days = (Date.current.beginning_of_month..Date.current.end_of_month).count
# salary_per_day = actual_salary / current_month_days
# calculated_salary = actual_salary - (salary_per_day * leave_count.to_i)
# @entry_to_update = EmpMonthlySalary.where(:salary_for=>Date.current.beginning_of_month..Date.current.end_of_month).find_by(:employee_id=>1)
# EmpMonthlySalary.where(:salary_for=>Date.current.beginning_of_month..Date.current.end_of_month).find_by(:employee_id=>1).update(:no_of_leave=>leave_count, :net_salary=>calculated_salary.round) if @entry_to_update