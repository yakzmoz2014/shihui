class OrderMailer < ApplicationMailer
  def notify_order_placed(order)
    @order = order
    @user  = order.user
    @meetup_lists = @order.meetup_lists

    mail(to: @user.email, subject: "[食·会] 感谢您完成本次订单，一下是您的购物明细 #{order.token}")
  end

  def apply_cancel(order)
    @order = order
    @user  = order.user
    @meetup_lists = @order.meetup_lists

    mail(to: "admin@test.com", subject: "[食·会]用户#{order.user.email} 申请取消订单 #{order.token}")
  end

  def notify_ship(order)
    @order = order
    @order = order.user
    @meetup_lists = @order.meetup_lists

    mail(to: @user.email, subject: "[食·会]您的订单#{order.token}已发货")
  end

  def notify_cancel(order)
    @order = order
    @order = order.user
    @meetup_lists = @order.meetup_lists

    mail(to:  @user.email, subject: "[食·会]您的订单#{order.token}已取消")
  end
end
