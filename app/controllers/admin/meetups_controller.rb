class Admin::MeetupsController < ApplicationController

  before_action :authenticate_user!
  before_action :admin_required
  layout "admin"

  def index
    @meetups = Meetup.all
  end

  def new
    @meetup = Meetup.new
  end

  def create
    @meetup = Meetup.new(meetup_params)
    if @meetup.save
      redirect_to admin_meetups_path
    else
      render :new
    end
  end

  def edit
    @meetup = Meetup.find(params[:id])
  end

  def update
    @meetup = Meetup.find(params[:id])
    if @meetup.update(meetup_params)
      redirect_to admin_meetups_path, notice: "更新成功"
    else
      render :edit
    end
  end

  def destroy
    @meetup = Meetup.find(params[:id])
    @meetup.destroy
    redirect_to admin_meetups_path, alert: "聚会已经删除"
  end

  private

  def meetup_params
    params.require(:meetup).permit(:title, :description, :quantity, :price)
  end
end
