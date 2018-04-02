class OrderNotifierMailer < ApplicationMailer

  def order_notification(franchisee, order_request)

  ActionMailer::Base.smtp_settings = {
    :address        => "smtp.gmail.com",
    :port           => 587,
    :domain         => "gmail.com",
    :authentication => :plain,
    :user_name      => "franchiseeinventoryorders@gmail.com",
    :password       => "braincarveorder",
    :enable_starttls_auto => true
  }
    @franchisee = Franchisee.find franchisee
    content = + "New Order from" + " " + @franchisee.location + "-" + @franchisee.franchisee_type
    @order_request = OrderRequest.find order_request
    #@order_items = @order_request.order_request_items
     mail( :from => "franchiseeinventoryorders@gmail.com", :to => "testingemail.thoughtbees@gmail.com",
     :subject => content)
  end

end











#mailid: franchiseeinventoryorders@gmail.com

#password: braincarveorder



#

# mail from: "franchiseeinventoryorders@gmail.com"
#     mail to: "testingemail.thoughtbees@gmail.com"
#     mail subject: content