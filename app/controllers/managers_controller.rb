class ManagersController < ApplicationController
  def index
    @auditions = Audition.all.order(:id)
  end
end
