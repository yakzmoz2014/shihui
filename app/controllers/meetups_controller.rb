class MeetupsController < ApplicationController
  def index
    @meetups = Meetup.all
  end

  def show
    @meetup = Meetup.find(params[:id])
  end

  def add_to_cart
    @meetup = Meetup.find(params[:id])
    if !current_cart.meetups.include?(@meetup)
      current_cart.add_meetup_to_cart(@meetup)
      flash[:notice] = "成功加入购物车"
      flash[:notice] = "你已成功将 #{@meetup.title} 加入购物车"
    else
      flash[:warning] = "购物车中已有同类物品"
    end
    redirect_to :back
  end
end
