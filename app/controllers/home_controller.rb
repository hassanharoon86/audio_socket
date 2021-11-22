class HomeController < ApplicationController
  before_action :check_user_status, only: [:index]

  private

  def check_user_status
    if current_user && current_user.manager?
      redirect_to managers_path
    end
  end
end
