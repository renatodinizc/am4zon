class AuthorsController < ApplicationController
  before_action :authenticate_admin!, only: %i[new create]

  def show
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(params.require(:author).permit(:name, :citizenship))
    if @author.save
      flash[:notice] = 'New author created successfully!'
      redirect_to admin_path current_admin
    else
      render :new
    end
  end
end
