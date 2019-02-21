class UsersController < ApplicationController
before_action :authenticate_user!, except: [:about, :new]
  def about

  end

  def show
    #@book = Book.find(params[:id])
    @user = User.find(params[:id])
    @books = @user.books.all
    #@book = Book.new

   # @user_images = @user.book_images.page(params[:page]).reverse_order
    @book = Book.new
  end

  def index
    @users = User.all
    # @user = User.new
    @book = Book.new
  	#@books = Book.all
    #book = Book.new

  end

  def new
  	#@book = Book.new
  end

  def create
  	#book = Book.new(book_params)
  	#book.save
  	#redirect_to book_path(book)
  end

  def edit
    #@book = Book.find(params[:id])
    @user = User.find(params[:id])
  end

  def update
     @user = User.find(params[:id])
       if @user.update(user_params)
        flash[:notice] = "successfully"
        redirect_to user_path(@user)
       else
        render :edit
       end
  end

  def destroy
    #book = Book.find(params[:id])
    #book.destroy
    #redirect_to books_path(book)

  end


   private
   def book_params
   	params.require(:user).permit(:title, :body, :image)
   end
   def user_params
    params.require(:user).permit(:name, :body, :image)
   end
end
