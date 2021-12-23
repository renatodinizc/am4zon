class GenresController < ApplicationController
  before_action :authenticate_admin!, only: %i[new create]

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(params.require(:genre).permit(:title))
    if @genre.save
      flash[:notice] = 'New genre created successfully!'
      redirect_to admin_path current_admin
    else
      render :new
    end
  end
end
