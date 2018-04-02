class EmployeeSalary < ApplicationRecord
  belongs_to :employee

  validates_presence_of :salary_amount, :account_holder_name, :account_number, :ifsc_code, :bank_name, :account_type, :message => "Required"
  validates :salary_amount, :account_number, :format => { :with => /\A\d+(?:\.\d{0,2})?\z/ }, :numericality => {:greater_than => 0}
  validates_uniqueness_of :account_number, :ifsc_code

end
