module Api
  module V1
    class BooksController < ApiController
      def index
        @books = Book.all
        render status: :ok,
               json: @books.to_json(only: %i[title description price],
                                    include: { author:
                                             { only: %i[name citizenship] } })
      end

      def show
        @book = Book.find(params[:id])
        render status: :ok,
               json: @book.to_json(only: %i[title description price],
                                   include: { author:
                                            { only: %i[name citizenship] } })
      end

      def create
        @book = Book.create(book_params)
        render json: @book, status: :created
      end

      private

      def book_params
        params.require(:book).permit(:title, :description, :price, :sale,
                                     :author_id, :genre_id)
      end
    end
  end
end
