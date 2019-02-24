class UsersController < ApplicationController

  before_action :authenticate_user!, except: [:top, :about]
  before_action :correct_user, only:[:edit, :update]

  def top
  end

  def about
  end

  def index
    @book = Book.new
    @users = User.all
    @user = current_user
  end

  def show
  	@user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end

  #編集機能用のアクションを定義。
  def edit
  end

  def update
    if @user.update(user_params)
    redirect_to user_path(@user.id)
    else
    render :edit
    end
end



  private
  def user_params
      params.require(:user).permit(:name, :introduction, :image)
  end

  def correct_user
    @user = User.find(params[:id])
    # 同じでなければリダイレクト。
    redirect_to root_path unless @user == current_user
  end

end
