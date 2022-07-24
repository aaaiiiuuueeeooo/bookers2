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
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end
  
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @show_book = Book.find(params[:id])
  end


  def edit
    @user = User.find(params[:id])
    @book = Book.find(params[:id])
  end
  
  def update
    @books = Book.all
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book.id)
  end  

 




  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end