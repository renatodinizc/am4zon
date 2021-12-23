class AdminsController < ApplicationController
  before_action :authenticate_admin!, :check_admin_identity, only: [:show]

  def show
    @admin = Admin.find(params[:id])
  end

  private

  def check_admin_identity
    return unless current_admin != Admin.find(params[:id])

    flash[:notice] = 'You do not access to that control panel'
    redirect_to admin_path current_admin
  end
end
