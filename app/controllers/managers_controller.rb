class ManagersController < ApplicationController
  before_action :authenticate_user!, :manager_only

  def index
    @auditions = Audition.all.order(:id)

    if params[:query].present?
      @auditions = @auditions.search(params[:query])
    end

    if params[:sorting_column].present?
      @auditions = @auditions.reorder(params[:sorting_column] + ' ' + params[:sorting_direction])
    end

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

  def manager_only
    if !current_user.manager?
      redirect_to root_path
    end
  end
end
