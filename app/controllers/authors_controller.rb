class AuthorsController < ApplicationController
  def new
    @author = Author.new
  end

  def create
    @author = Author.new(params.require(:author).permit(:name, :nationality))
    if @author.save
      flash[:notice] = 'New author created successfully!'
      redirect_to admin_path current_admin
    else
      render :new
    end
  end
end
