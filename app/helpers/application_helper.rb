module ApplicationHelper

	def Superadmin?
		#if User.find(session[:user_id]).user_role.role.role_name == "Superadmin" 
		if User.find(session[:user_id]).user_roles.find_by(:role_id=>Role.find_by(:role_name=>"Superadmin")).present?
       		true
    	end
	end

  	def Admin?
		#if User.find(session[:user_id]).role.role_name == "Admin" 
       	if User.find(session[:user_id]).user_roles.find_by(:role_id=>Role.find_by(:role_name=>"Admin")).present?
       		true
    	end
	end

end
