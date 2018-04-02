class FranchiseeAgreement < ApplicationRecord
  belongs_to :franchisee
   #validates_presence_of :amount, :gst, :advance_amount_gst, :center_address, :city, :state, :message=> "Required"
   #validates_presence_of :agreement_date, :duration_in_month, :pincode, :message=> "Required"
   #validates :duration_in_month, :pincode, :numericality => {:only_integer => true}
   #validates :advance_amount_gst, :amount, :duration_in_month, :gst, :format => { :with => /\A\d+(?:\.\d{0,2})?\z/ }, :numericality => {:greater_than => 0}
end
