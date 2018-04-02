module AnnouncementsHelper

	def announcement_for_list
		["All", Franchisee.all]
		
	end

end
