class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @users = User.all
    @user =  current_user
    @book = Book.new
  end   
  
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @show_book = @user.books
  end

  def edit
    @user = User.find(params[:id])
    
  end
  
  
  def update
    @user = User.find(params[:id])
    @user.save
    redirect_to user_path(@user.id)
  end   
  
  private
  
  def  user_params
    params.require(:user).permit(:name,:introduction,:profile)
  end   
end
