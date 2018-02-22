class BooksController < ApplicationController

  def index
  		@book = Book.new
  		@books = Book.all

  end

  def new
  		@book = Book.new
  end

  def create
  		@book =Book.new(book_params)
  		@book.save
  		redirect_to book_path(@book), flash: {notice: 'Book was successfully created.'}


  end

  def top
  end

  def show
      @book = Book.new
  		@book = Book.find(params[:id])
  end

  def edit
  		@book = Book.find(params[:id])
  end

  def update
  		book = Book.find(params[:id])
  		book.update(book_params)
  		redirect_to book_path(book)
  end

  def destroy
  		book = Book.find(params[:id])
  		book.destroy
  		redirect_to books_path, flash: {notice: 'Book was successfully destroyed.'}
  end
private

    def book_params
        params.require(:book).permit(:title, :body,)
    end
end