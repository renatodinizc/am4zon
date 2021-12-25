class BookCollectionsController < ApplicationController
  before_action :authenticate_admin!, only: %i[new create]

  def show
    @book_collection = BookCollection.find(params[:id])
  end

  def new
    @book_collection = BookCollection.new
  end

  def create
    @book_collection = BookCollection.new(book_collection_params)
    if @book_collection.save
      flash[:notice] = 'New book collection created successfully!'
      redirect_to admin_path current_admin
    else
      render :new
    end
  end

  private

  def book_collection_params
    params.require(:book_collection).permit(:title, :description, :price,
                                            :book1_id, :book2_id, :book3_id,
                                            :book4_id, :book5_id, :book6_id,
                                            :book7_id)
  end
end
