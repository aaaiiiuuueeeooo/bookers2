class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @user = User.all
    @user = current_user
  end   
  
  def show
    @user = User.find(params[:id])
    @book = @user.book
  end

  def edit
    @user = User.find(params[:id])
    
  end
  
  
  def update
    @user = User.find(params[:id])
    @user.save
    redirect_to 'root_path'
  end   
end
