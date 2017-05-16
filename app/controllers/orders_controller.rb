class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def show
    @order = Order.find_by_token(params[:id])
    @meetup_lists = @order.meetup_lists
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @order.total = current_cart.total_price

    if @order.save  # 订单建立后生成购买明细缓存
      current_cart.cart_items.each do |cart_item|
        meetup_list = MeetupList.new
        meetup_list.order = @order
        meetup_list.meetup_name = cart_item.meetup.title
        meetup_list.meetup_price = cart_item.meetup.price
        meetup_list.quantity = cart_item.quantity
        meetup_list.save
      end
      redirect_to order_path(@order.token)
    else
      render "carts/checkout"
    end
  end

  private

  def order_params
    params.require(:order).permit(:billing_name, :billing_address, :shipping_name, :shipping_address)
  end
end
