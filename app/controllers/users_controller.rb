class UsersController < ApplicationController
  before_action :authenticate_user!, :check_user_identity,
                only: %i[show edit update]

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

  def check_user_identity
    return unless current_user != User.find(params[:id])

    flash[:notice] = 'You do not have access to that profile'
    redirect_to user_path current_user
  end
end
