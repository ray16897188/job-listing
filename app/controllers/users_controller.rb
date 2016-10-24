class UsersController < ApplicationController
  

  def index
  	@users = User.where(is_admin: false).where.not(id: current_user.id).order("email DESC")

  end

  def show
  	@user = User.find(params[:id])
  end

  def add_friend
  	@user = User.find(params[:id])
  end
end
