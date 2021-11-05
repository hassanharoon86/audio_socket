class ManagersController < ApplicationController
  before_action :authenticate_user!, :manager_only

  def index
    @auditions = Audition.all.order(:id)

    if params[:query].present?
      @auditions = Audition.search(params[:query])
    end

    if params[:sorting_column].present?
      @auditions = Audition.all.order(params[:sorting_column] + ' ' + params[:sorting_direction])
    end
  end

  private

  def manager_only
    if !current_user.manager?
      redirect_to root_path
    end
  end
end
