class BooksController < ApplicationController
  def root_path
    
  end
  def index
    @books = Book.all
    @book = Book.new
  end
  def show
    @book = Book.find(params[:id])
    
  end
  def edit
    @book = Book.find(params[:id])
    #(params[:id])はurlからidを引っ張ってきてそのid番号に紐づいたモデルを＠bookに入れて表示する
  end
  
  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully created.。"
      redirect_to book_path(@book.id)
      #redirect_toはルーティングのパスに移動しルーティングを通すためここだとindexアクションを実行しGET、ページ移動する
    else
      @books = Book.all
      render :index
      #renderはアクション(この場合index)を直接書くやり方でindexに移動する際アクションを実行しないこの場合@bookにエラーが残った状態でindexページにいく。だが、indexページでは@booksを使用しているため定義しないとエラーが出る。そのためrenderの前で@booksで定義し直してあげる
      # redirect_to books_path
    end
  end
  def update
     @book = Book.find(params[:id])
     @book.update(book_params)
    if @book.save
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end
  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice] = "Book was successfully destroyed."
    redirect_to '/books'
  end
  # private以下の呼び出しに制限をかける（urlに紐づかないように）
  private#他のファイルでは使えずコントローラ内でのみ使われる処理
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
end