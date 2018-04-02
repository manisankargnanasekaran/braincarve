class Batch < ApplicationRecord
has_many :students, :dependent => :destroy
validates_presence_of :batch_no, :day, :batch_time, :message=> "Required"
#validates :batch_no, uniqueness: true

#validates :day, uniqueness: { scope: :batch_time }

#validates :created_by_id, uniqueness: {:scope => %i[:batch_time, :day]}

  def batch_name
  	 "#{batch_no} - #{day} (#{batch_time} - #{batch_end_time.to_time.strftime("%I:%M %p")})" if batch_end_time
  end

end





#validates_uniqueness_of :batch_no, scope: %i[day batch_time]