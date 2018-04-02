class Student < ApplicationRecord
	has_one :student_detail, :dependent => :destroy
	belongs_to :batch
	has_many :attendance
	accepts_nested_attributes_for :student_detail
	validates :student_name, :dob, :program, :batch_id, :gender, :student_class, :address, :school_name, :registration_date, presence: { :message => "Required" }
	
	# validates_length_of :contact_no, :minimum=>6, :maximum => 10, :allow_blank=> true, :message=> "Invalid"
	# validates :contact_no, :numericality => true, :allow_blank=> true
    validates :contact_no, :presence => { :message => "Required"}
    					#:uniqueness => { :message => "Already exists" },
    					
	validates_length_of :student_name, :minimum => 4
	enum gender:{"Male"=> 1, "Female"=> 2}
	enum level:{ "tiny tots"=> "1", "tiny tots b"=> "2", "junior"=> "3" , "junior b"=> "4", "level 1"=> "5", "level 2"=> "6", "level 3"=> "7", "level 4"=> "8", "level 5"=> "9", "level 6"=> "10" }



end
