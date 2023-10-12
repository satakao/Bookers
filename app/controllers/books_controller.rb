class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
  end
  def create
    book = Book.new(book_params)
    if book.save
       redirect_to book_path(book.id)
    else
      flash.now[:alert] = "投稿に失敗しました"
    end
  end
  def update
    book = book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(list.id)
  end
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to 'books'
  end
  # private以下の呼び出しに制限をかける（urlに紐づかないように）
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
