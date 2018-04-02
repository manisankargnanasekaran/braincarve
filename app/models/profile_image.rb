require 'carrierwave'
require 'carrierwave/orm/activerecord'
class ProfileImage < ApplicationRecord
	mount_uploader :image_url, ProfileImageUploader
	has_one :employee, :dependent => :destroy
end

