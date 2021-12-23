class BooksController < ApplicationController
  before_action :authenticate_admin!, only: %i[new create]

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(params.require(:book).permit(:title, :description,
                                                  :author_id, :genre_id))
    if @book.save
      flash[:notice] = 'New book created successfully!'
      redirect_to admin_path current_admin
    else
      render :new
    end
  end
end
