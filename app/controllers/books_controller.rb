class BooksController < ApplicationController

  before_action :authenticate_user!
  before_action :correct_user, only:[:edit, :update]

  def show
    @book = Book.find(params[:id])
    @newbook = Book.new
  end

  def index
    # @user = current_user
    @books = Book.all
    @book = Book.new
    @user = User.all
  end

  def create
  	#form_forを使う時、空のインスタンスを渡す。
  	@book = Book.new(book_params)
  	@book.user_id = current_user.id
  	if @book.save
  	  redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end

  def edit
  end

  # 追加アクション。Editページの更新を行うため。
  def update
    if @book.update(book_params)
      redirect_to book_path
    else
      render :edit
    end
  end

  def destroy
    # 投稿データの取得,投稿データの削除,リダイレクト（一覧ページへ）
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
   redirect_to root_path unless @book.user_id == current_user.id
  end

end
