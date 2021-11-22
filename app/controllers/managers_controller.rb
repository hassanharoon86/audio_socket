class ManagersController < ApplicationController
  before_action :authenticate_user!
  before_action :verify_manager_user

  def index
    @auditions = Audition.all

    @auditions = @auditions.search(params[:query]) if params[:query].present?

    @auditions = @auditions.order(params[:sorting_column] => params[:sorting_direction]) if params[:sorting_column].present?

    if params[:scope].present?
      @auditions = @auditions.pending if params[:scope] == 'Pending'
      @auditions = @auditions.approved if params[:scope] == 'Approved'
      @auditions = @auditions.rejected if params[:scope] == 'Rejected'
      @auditions = @auditions.deleted if params[:scope] == 'Deleted'
      @auditions = @auditions.all if params[:scope] = 'All'
    end
  end

  private

  def verify_manager_user
    redirect_to root_path if !current_user.manager?
  end
end
