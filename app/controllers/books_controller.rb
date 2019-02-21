class BooksController < ApplicationController

 before_action :authenticate_user!
 # before_action :correct_user, only: [:edit, :update]

  def show
    @book = Book.new
    @bookn = Book.find(params[:id])
    @user = @bookn.user
  end

  def index
  	@books = Book.all
    @book = Book.new
    @bookn = User.find(current_user.id)
  end

  def new
  	@book = Book.new
  end

  def create
  	@book = Book.new(book_params)
    @book.user_id = current_user.id
  	if @book.save
      flash[:notice] = "successfully"
  	   redirect_to book_path(@book)
     else
      @user =current_user
      @books = @user.books.all
      render 'users/show'
    end
  end

  def edit
    @book = Book.find(params[:id])
    if current_user.id != @book.user.id
      redirect_to book_path(@book)
    end
  end

  def update
  @book = Book.find(params[:id])
             if @book.update(book_params)
                flash[:notice] = "successfully"
                redirect_to book_path(@book)
             else
                render 'books/edit'
             end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path

  end


   private
   def book_params
   	params.require(:book).permit(:title,:body)
   end
end
