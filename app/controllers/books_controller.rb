class BooksController < ApplicationController
  before_action :authenticate_user!

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = 'successfully'
      redirect_to book_path(@book.id)
    else
      flash[:notice] = 'error'
      redirect_to books_path
    end
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user_id != current_user.id
    redirect_to books_path
    end
  end

  def index
    @user = current_user
    @users = User.all
    @book = Book.new
    @books = Book.all
  end

  def show
    @new_book = Book.new
    @book = Book.find(params[:id])
    @books = Book.all
    @user = @book.user
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = 'You have creatad book successfully.'
      redirect_to book_path(@book.id)
    else
      flash[:notice] = 'error prohibited this obj from being saved'
      render :edit
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :profile_image)
  end

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end