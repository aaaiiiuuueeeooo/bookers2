class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @user = user.find(params[:])
  end   
  
  def show
    @user = user.find(params[:id])
    @book = @user.book
  end

  def edit
    @user = user.find(params[:id])
  end
end
