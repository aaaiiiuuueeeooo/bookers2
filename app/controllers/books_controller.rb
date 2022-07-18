class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def index
    @user = current_user
    @book = Book.new
    @books = Book.all
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user
    @book.save
    redirect_to books_path
  end


  def edit
    @user = User.find(params[:id])
  end
  
  def show
  end 




  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end