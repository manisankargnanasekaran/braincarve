class Vendor < ApplicationRecord
	has_many :purchases, :dependent => :destroy

	validates_presence_of :vendor_name, :contact_no, :vendor_address, :gst_percentage, :message=> "Required"
	validates :gst_percentage, :numericality => true
	validates :contact_no, :numericality => {:only_integer => true}
end
