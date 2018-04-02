class InvoiceNotifierMailer < ApplicationMailer

  default :from => 'testingemail.thoughtbees@gmail.com'

  def send_invoice(user, order_request)
    @user = User.find user
    @order_request = OrderRequest.find order_request
    @order_items = @order_request.order_request_items

    mail( :to => @user.email_id,
    :subject => 'Inventory Order Invoice Detail' )
  end

end
