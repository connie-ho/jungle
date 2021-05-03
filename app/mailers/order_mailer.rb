class OrderMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.order_confirmation.subject
  #
  def order_confirmation(order)
    @order = order
    mail to: 'python.connie@gmail.com', subject: 'Order Confirmation'
  end
end
