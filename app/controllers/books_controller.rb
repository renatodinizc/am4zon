class BooksController < ApplicationController
  before_action :authenticate_admin!, only: %i[new create]

  def show
    @book = Book.find(params[:id])
    @book_collections = BookCollection.where(book1: @book)
                                      .or(BookCollection.where(book2: @book))
                                      .or(BookCollection.where(book3: @book))
                                      .or(BookCollection.where(book4: @book))
                                      .or(BookCollection.where(book5: @book))
                                      .or(BookCollection.where(book6: @book))
                                      .or(BookCollection.where(book7: @book))
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(params.require(:book).permit(:title, :description,
                                                  :author_id, :genre_id,
                                                  :price))
    if @book.save
      flash[:notice] = 'New book created successfully!'
      redirect_to admin_path current_admin
    else
      render :new
    end
  end
end
