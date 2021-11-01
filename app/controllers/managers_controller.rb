class ManagersController < ApplicationController
  def index
    if params[:query].present?
      # byebug
      @auditions = Audition.search(params[:query])
    else
      @auditions = Audition.all.order(:id)
    end
  end
end
