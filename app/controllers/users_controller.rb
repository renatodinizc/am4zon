class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(params.require(:user).permit(:name, :birth_date,
                                                 :occupation, :citizenship,
                                                 :description))
    redirect_to user_path(@user)
  end
end
