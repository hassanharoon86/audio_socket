class ManagersController < ApplicationController
  before_action :authenticate_user!
  before_action :verify_manager_user

  def index
    @auditions = Audition.all.order(:id)

    @auditions = Audition.search(params[:query]) if params[:query].present?

    if params[:sorting_column].present?
      @auditions = Audition.all.order(params[:sorting_column] => params[:sorting_direction])
    end
  end

  private

  def verify_manager_user
    if !current_user.manager?
      redirect_to root_path
    end
  end
end
