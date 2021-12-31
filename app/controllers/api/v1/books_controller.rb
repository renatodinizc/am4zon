module Api
  module V1
    class BooksController < ActionController::API
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
    end
  end
end
