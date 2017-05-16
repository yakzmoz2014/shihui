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
    flash[:notice] = "成功加入购物车"
    redirect_to :back

  end
end
