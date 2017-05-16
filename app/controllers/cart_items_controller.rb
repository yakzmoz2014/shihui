class CartItemsController < ApplicationController
  def destroy
    @cart = current_cart
    @cart_item = @cart.cart_items.find_by(meetup_id: params[:id])
    @meetup = @cart_item.meetup
    @cart_item.destroy

    flash[:warning] = "成功将 #{@meetup.title} 从购物车删除！"
    redirect_to :back
  end
end
