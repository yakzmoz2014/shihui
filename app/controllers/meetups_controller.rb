class MeetupsController < ApplicationController
  def index
    @meetups = Meetup.all
  end

  def show
    @meetup = Meetup.find(params[:id])
  end

  def add_to_cart
    @meetup = Meetup.find(params[:id])
    current_cart.add_meetup_to_cart(@meetup)
    redirect_to :back
    flash[:notice] = "添加购物车测试"
  end
end
