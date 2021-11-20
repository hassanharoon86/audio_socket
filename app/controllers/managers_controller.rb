class ManagersController < ApplicationController
  before_action :authenticate_user!
  before_action :verify_manager_user

  def index
    # byebug
    @auditions = Audition.all

    @auditions = @auditions.search(params[:query]) if params[:query].present?

    @auditions = @auditions.order(params[:sorting_column] + ' ' + params[:sorting_direction]) if params[:sorting_column].present?
  end

  private

  def verify_manager_user
    redirect_to root_path if !current_user.manager?
  end
end
