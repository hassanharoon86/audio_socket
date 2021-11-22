class ManagersController < ApplicationController
  before_action :authenticate_user!
  before_action :verify_manager_user

  def index
    @auditions = Audition.all

    @auditions = @auditions.search(params[:query]) if params[:query].present?

    @auditions = @auditions.order(params[:sorting_column] + ' ' + params[:sorting_direction]) if params[:sorting_column].present?

    if params[:scope].present?
      if params[:scope] == 'Pending'
        @auditions = @auditions.pending
      elsif params[:scope] == 'Approved'
        @auditions = @auditions.approved
      elsif params[:scope] == 'Rejected'
        @auditions = @auditions.rejected
      elsif params[:scope] == 'Deleted'
        @auditions = @auditions.deleted
      elsif params[:scope] = 'All'
        @auditions = @auditions.all
      end
    end
  end

  private

  def verify_manager_user
    redirect_to root_path if !current_user.manager?
  end
end
