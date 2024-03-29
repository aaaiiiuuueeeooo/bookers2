class BooksController < ApplicationController
  before_action :authenticate_user!,expect: [:top]
  before_action :correct_user, only: [:edit, :update]


  def index
    @user = current_user
    @book = Book.new
    @books = Book.all
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
       flash[:notice] = "You have created book successfully."
       redirect_to book_path(@book.id)
    else
      @user = current_user
      @books = Book.all
      render :index
    end  
  end
  
  def show
    @book = Book.new
    @show_book = Book.find(params[:id])
    @user = @show_book.user
  end


  def edit
    
    @book = Book.find(params[:id])
    
  end
  
  def update
    @books = Book.all
    @book = Book.find(params[:id])
    if @book.update(book_params)
       flash[:notice] = "You have updated book successfully."
       redirect_to book_path(@book.id)
    else
       @books = Book.all
       render :edit
    end   
  end  
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end   

 




  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  def correct_user
    @book = Book.find(params[:id])
    @user = @book.user
    redirect_to(books_path) unless @user == current_user
  end  

end