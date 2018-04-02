class PasswordResetMailer < ApplicationMailer

  default :from => 'testingemail.thoughtbees@gmail.com'

  def password_reset_email(user, base_url, first_time_password)
    @user = User.find user
    @base_url = base_url
    @first_time_password_creation = first_time_password
    mail( :to => @user.email_id,
    :subject => 'Password Reset Email from Braincarve' )
  end

end
