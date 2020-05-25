class UsersController < ApplicationController
 before_action :authenticate_user!, only: [:index, :show, :edit, :new ]
  def index
    @book = Book.new
    @user = current_user
    @users = User.all
  end

  def show
    @user = current_user
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books.order(created_at: :desc)
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
    redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = 'successfully'
      redirect_to user_path(@user.id)
    else
      flash[:notice] = 'error'
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
