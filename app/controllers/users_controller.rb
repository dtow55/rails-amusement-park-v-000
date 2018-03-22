class UsersController < ApplicationController
  before_action :login_check, only: [:show]
  
  def new
    @user = User.new()
  end

  def create
    #binding.pry
    user = User.create(user_params)
    redirect_to user_path(user)
    session[:user_id] = user.id
  end

  def show
    login_check
    
    @user = User.find(session[:user_id])
  end

  private

  def user_params
    params[:user].permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
  end

  def login_check
    if !(session[:user_id] == params[:id].to_i)
      #binding.pry
      redirect_to root_path
    end
  end

end