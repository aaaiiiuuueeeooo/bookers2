class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def index
    @user = current_user
    @book = Book.new
  end

  def create
    book = Book.new(book_params)
    book.save
    redirect_to 'edit_book_path'
  end


  def edit
    @user = user.find(params[:id])
  end




  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end