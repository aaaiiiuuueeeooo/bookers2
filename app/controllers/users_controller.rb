class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @user = User.all
  end   
  
  def show
    @user = User.find(params[:id])
    @book = @user.book
  end

  def edit
    @user = User.find(params[:id])
    
  end
  
  def updated
    @user.save
    redirect_to 'root_path'
  end   
end
