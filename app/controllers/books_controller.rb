class BooksController < ApplicationController

  def new
    　@book = Book.new
     #@BookにBook.newの情報入れる
  end

  def create
    @book = Book.new(book_params)
    if book.save
      redirect_to '/books/:id'
    else
      render :new
    end
    
  end

  def index
    @books = Book.all
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

