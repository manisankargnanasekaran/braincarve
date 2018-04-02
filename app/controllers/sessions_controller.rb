class SessionsController < ApplicationController
  skip_before_action :check_session, only:[:new, :validate_logins, :forgot_password, :forgot_password_link, :reset_password]
  def new
    render :layout => false
  end

  
  def validate_logins
    @user = User.authenticate(params[:email_id], params[:password])
	  if @user
      session[:user_id] = @user.id
      if @user.user_roles[0].role.role_name == "Superadmin"
        redirect_to root_url
      else
        redirect_to franchisee_dashboard_path
      end

	  else
	    redirect_to root_url, alert: "Bad Credentials"
	  end
  end


  def forgot_password
    render :layout => false    
  end

  def forgot_password_link
    @verified_user = User.find_by(email_id: params[:email_id])     
      if @verified_user.present?
          PasswordResetMailer.password_reset_email(@verified_user.id, request.base_url, :first_time_password=>nil).deliver_now!
          redirect_to sessions_forgot_password_url, notice: "Check your Email to reset your password."
      else
          redirect_to sessions_forgot_password_url, alert: "Not a registered email" 
      end
  end

 def reset_password
   @user = User.find(params[:user_id])
   render :layout => false
 end
  
  def destroy
  	session[:user_id] = nil
  	redirect_to root_url, notice: "You've been logged out successfully."
  end
end
