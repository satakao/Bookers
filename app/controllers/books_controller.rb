class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
  end
  def show
    @book = Book.find(params[:id])
    
  end
  def edit
    @book = Book.find(params[:id])
  end
  
  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book.id)
    else
      redirect_to :index
      # redirect_to books_path
    end
  end
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end
  # private以下の呼び出しに制限をかける（urlに紐づかないように）
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
end