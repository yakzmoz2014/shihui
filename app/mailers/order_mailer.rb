class OrderMailer < ApplicationMailer
  def notify_order_placed(order)
    @order = order
    @user  = order.user
    @meetup_lists = @order.meetup_lists

    mail(to: @user.email, subject: "[食·会] 感谢您完成本次订单，一下是您的购物明细 #{order.token}")
  end
end
