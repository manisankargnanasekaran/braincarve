class StudentRating < ApplicationRecord

enum student_rating:{"Excellent"=> 1, "Consistent"=> 2, "Satisfactory"=> 3, "Effort_Required"=> 4}

  belongs_to :attendance, :dependent => :destroy

end
