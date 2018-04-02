class Attendance < ApplicationRecord

  belongs_to :student
  has_many :student_ratings,:dependent => :destroy

  accepts_nested_attributes_for :student_ratings

end
