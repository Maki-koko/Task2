class BooksController < ApplicationController

  def create
    @book = Book.new(book_params)
    #データをフィルターにかける為、book_params必要
    if @book.save
      redirect_to book_path(@book.id)
      # book_path=URLのPrefix、@book.id=id番号をbook_pathのURL(:id)に代入できるようにする？
    else
      render :new
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
    book = Book.find(params[:id])
    book.update(book_params)
    #更新データもフィルターかける為、book_params必要
    redirect_to books_path(book.id)  
  end
  
  def destroy
    book = Book.find(params[:id])
    Book.destroy
    redirect_to'/books'
  end
  
  private
  #ここから下はこのファイル内でしか呼び出せない
  def book_params
    params.require(:book).permit(:title,:body)
  end
  
end

