class BooksController < ApplicationController
  def index
    @books = Book.all
  end
  def destroy
    book
    
  end
end
