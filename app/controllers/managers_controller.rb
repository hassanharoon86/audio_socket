class ManagersController < ApplicationController
  before_action :authenticate_user!, :manager_only

  def index
    if params[:query].present?
      @auditions = Audition.search(params[:query])
    elsif params[:sort].present?
      @auditions = Audition.order(params[:sort]+' '+params[:order])
    else
      @auditions = Audition.all.order(:id)
    end
  end

  private

  def manager_only
    if !current_user.manager?
      redirect_to root_path, notice: "You don't have access to this page"
    end
  end
end
