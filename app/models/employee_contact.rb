class EmployeeContact < ApplicationRecord
  belongs_to :employee

  validates_presence_of :contact_no, :address, :pincode, :message => "Required"
  validates_length_of :contact_no, :minimum=>6
  validates :contact_no, :numericality => {:only_integer => true}
  validates :pincode, :numericality => {:only_integer => true}
  validates_uniqueness_of :contact_no
end
