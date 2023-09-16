class BooksController < ApplicationController
  
  def create
    @book = Book.new(book_params)
    #データをフィルターにかける為、book_params必要
    if @book.save
      flash[:notice] = "Your post has been successfully registered."
      redirect_to book_path(@book.id)
      # book_path=URLのPrefix、@book.id=id番号をbook_pathのURL(:id)に代入できるようにする？
      else
         @books = Book.all
         render :index
    end
  end

  def index
    @books = Book.all
    @book = Book.new
    # 新規投稿のデータを入れる箱もindex内に用意する
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    #更新データもフィルターかける為、book_params必要
      flash[:notice] = "Your post has been successfully registered."
      redirect_to book_path(@book.id) 
      else
        render :edit
    end
  end
  
  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      flash[:notice] = "The post was successfully deleted."
      redirect_to '/books'
      else
        @books = Book.all
        render :index
    end
  end
  
  
  private
  #ここから下はこのファイル内でしか呼び出せない
  def book_params
    params.require(:book).permit(:title,:body)
  end
  
end

