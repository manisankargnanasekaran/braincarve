class StudentDetail < ApplicationRecord
  belongs_to :student
  has_many :student_fee_pays
 
  validates_format_of :father_email, :mother_email, with: /\A[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info))\z/i, :allow_blank => true, :message=> "Invalid"
  validates_presence_of :father_name, :mother_name, :message=> "Required"
 
  validates_length_of :father_contact_no, :mother_contact_no, :minimum => 10, :allow_blank => true, :message=> "Invalid"
  
end
