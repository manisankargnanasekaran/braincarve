require 'carrierwave'
require 'carrierwave/orm/activerecord'
class FranchiseeDocument < ApplicationRecord
	mount_uploader :image_url, ImageUploader	
	has_one :franchisee, :dependent => :destroy 
	has_many :agreement_renewals, :dependent => :destroy
end
