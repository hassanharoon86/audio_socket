class ManagersController < ApplicationController
  def index
    if params[:query].present?
      @auditions = Audition.search(params[:query])
    elsif params[:sort].present?
      @auditions = Audition.order(params[:sort]+' '+params[:direction])
    else
      @auditions = Audition.all.order(:id)
    end
  end
end
