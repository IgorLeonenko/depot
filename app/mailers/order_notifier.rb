class OrderNotifier < ApplicationMailer
  default from: 'Leon <depot@example.com>'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.received.subject
  #
  def received(order)
    @greeting = "Hi"

    @order = order

    mail to: order.email, subject: "Order confirmation from Pragmatic shop"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.shipped.subject
  #
  def shipped(order)
    @greeting = "Hi"

    @order = order

    mail to: order.email, subject: "Order has been delivered"
  end
end
