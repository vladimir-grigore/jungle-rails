class ReceiptMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def mail_order_receipt(order)
    @order = order
    mail(to: @order.email, subject: "Order #{@order.id} receipt")
  end
  
end
