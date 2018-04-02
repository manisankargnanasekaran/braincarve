class Announcement < ApplicationRecord
	has_many :announcement_for, :dependent => :destroy
	 accepts_nested_attributes_for :announcement_for, :reject_if => :all_blank, allow_destroy: true
end
