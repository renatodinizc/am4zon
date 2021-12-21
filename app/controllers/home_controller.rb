class HomeController < ApplicationController
  def index
    @books = Book.all
  end

  def search
    search_strip = params[:search].strip
    # Query simples de busca por título:
    # @books = Book.where('title LIKE ?', "%#{ search_strip }%")

    # Query exclusiva para busca de strips de autores:
    # @books = Book.joins(:author)
    # .where('authors.name LIKE ?', "%#{ search_strip }%" )
    # .includes(:author)

    # Quenry completa: busca a strip nos títulos e nos nomes dos autores:
    @books = Book.joins(:author).where('title LIKE ?', "%#{search_strip}%")
                 .or(Book.joins(:author)
                 .where('authors.name LIKE ?', "%#{search_strip}%"))
    @authors = Author.where('name LIKE ?', "%#{search_strip}%")
  end
end
