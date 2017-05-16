class CartItemsController < ApplicationController
  def destroy
    @cart = current_cart
    @cart_item = @cart.cart_items.find_by(meetup_id: params[:id])
    @meetup = @cart_item.meetup
    @cart_item.destroy

    flash[:warning] = "成功将 #{@meetup.title} 从购物车删除！"
    redirect_to :back
  end

  def update
    @cart = current_cart
    @cart_item = @cart.cart_items.find_by(meetup_id: params[:id])
    if @cart_item.meetup.quantity >= cart_item_params[:quantity].to_i

      @cart_item.update(cart_item_params)
      flash[:notice] = "成功变更数量"
    else
      flash[:warning] = "库存不足，无法加入购物车"
    end
    redirect_to carts_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:quantity)
  end
end
