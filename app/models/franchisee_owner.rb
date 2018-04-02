class FranchiseeOwner < ApplicationRecord
  belongs_to :franchisee
   #validates_presence_of :first_name, :last_name, :address, :id_proof, :message => "Required"
   #validates_length_of :first_name, :last_name, :minimum => 3, :message => "Invalid"
   validates :contact_no, :numericality => true, :allow_blank=> true
   #validates :contact_no, :presence => { :message => "Required"}
end
