class EmpMonthlySalary < ApplicationRecord
  belongs_to :employee

  def self.monthly_salary_entry
  	Employee.all.map{|each_employee| EmpMonthlySalary.create(employee_id: each_employee.id, salary_for: Date.today, net_salary: each_employee.employee_salary.salary_amount.round)}
  end

  def self.salary_entry_updation(employee_id)

  	leave_count = EmployeeAttendance.where(:employee_id=>employee_id, :leave_date=>Date.current.beginning_of_month..Date.current.end_of_month).count

    actual_salary = Employee.find(employee_id).employee_salary.salary_amount

    current_month_days = (Date.current.beginning_of_month..Date.current.end_of_month).count

    salary_per_day = (actual_salary / current_month_days).round
    calculated_salary = actual_salary - (salary_per_day * leave_count)

    EmpMonthlySalary.where(:salary_for=>Date.current.beginning_of_month..Date.current.end_of_month).find_by(:employee_id=>employee_id).update(:no_of_leave=>leave_count, :net_salary=>calculated_salary.round)
  end

end


