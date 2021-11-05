class ManagersController < ApplicationController
  before_action :authenticate_user!, :manager_only

  def index
    @auditions = Audition.all.order(:id)

    if params[:query].present?
      @auditions = Audition.search(params[:query])
    end

    if params[:sorting_column].present?
      @auditions = Audition.order(params[:sorting_column] + ' ' + params[:sorting_direction])
    end

    if params[:scope].present?
      if params[:scope] == 'Pending'
        @auditions = Audition.pending.order(:id)
      elsif params[:scope] == 'Approved'
        @auditions = Audition.approved.order(:id)
      elsif params[:scope] == 'Rejected'
        @auditions = Audition.rejected.order(:id)
      elsif params[:scope] == 'Deleted'
        @auditions = Audition.deleted.order(:id)
      elsif params[:scope] = 'All'
        @auditions = Audition.all.order(:id)
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
