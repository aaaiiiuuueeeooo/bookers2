class UsersController < ApplicationController
  def show
    @user = user.find(params[:id])
    @book = @user.book
  end

  def edit
  end
end
