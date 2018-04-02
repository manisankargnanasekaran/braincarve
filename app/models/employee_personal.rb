class EmployeePersonal < ApplicationRecord
  belongs_to :employee

  validates_presence_of :date_of_birth, :message => "Required"
end
