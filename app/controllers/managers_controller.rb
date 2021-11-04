class ManagersController < ApplicationController
  before_action :authenticate_user!, :manager_only

  def index
    if params[:query].present?
      @auditions = Audition.search(params[:query])
    elsif params[:sorting_column].present?
      @auditions = Audition.all.order(params[:sorting_column] + ' ' + params[:sorting_direction])
    else
      @auditions = Audition.all.order(:id)
    end
  end

  private

  def manager_only
    if !current_user.manager?
      redirect_to root_path
    end
  end
end
