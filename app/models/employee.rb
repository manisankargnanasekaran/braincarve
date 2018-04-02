class Employee < ApplicationRecord
	has_one :employee_salary, :dependent => :destroy
	has_one :employee_personal, :dependent => :destroy
	has_one :employee_contact, :dependent => :destroy
	has_many :employee_attendances, :dependent => :destroy
	has_many :emp_monthly_salaries, :dependent => :destroy
	belongs_to :profile_image, optional: true
	mount_uploader :resume, ResumeUploader

	accepts_nested_attributes_for :employee_salary, allow_destroy: true
	accepts_nested_attributes_for :employee_personal, allow_destroy: true
	accepts_nested_attributes_for :employee_contact, allow_destroy: true
	accepts_nested_attributes_for :profile_image, allow_destroy: true

	validates_presence_of :employee_identity, :prefix, :first_name, :last_name, :date_of_joining, :message => "Required"
	validates_format_of :email_id, with: /\A[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info))\z/i, :allow_blank => true, :message=> "Invalid"
	validates_uniqueness_of :employee_identity
	validates_uniqueness_of :email_id

	def self.create_salary_entry(emp_id, date_of_joining, salary_amount)
		
		leave_count = (Date.today.beginning_of_month...date_of_joining.to_date).count

		salary_per_day = (salary_amount.to_f / ((Date.today.beginning_of_month..Date.today.end_of_month).count))
		 
		salary_payable = salary_amount.to_f - (salary_per_day * leave_count) 
		#if date_of_joining.to_date.month == Date.current.month && date_of_joining.to_date.year == Date.current.year
  			EmpMonthlySalary.create(employee_id: emp_id, salary_for: date_of_joining.to_date, no_of_leave: leave_count, net_salary: salary_payable.round)
  	end

  	def self.create_leave_entry(emp_id, date_of_joining)
  		@leave_dates = (date_of_joining.to_date.beginning_of_month)..(date_of_joining.to_date-1)
  		@leave_dates.map do |date_of_leave|
  			EmployeeAttendance.create(employee_id: emp_id, leave_date: date_of_leave, reason: "Joined in the middle", apply_date: date_of_joining)
  		end
  	end


end
