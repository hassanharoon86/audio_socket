class HomeController < ApplicationController

  def index
    if user_signed_in?
      if current_user.role == 'manager'
        redirect_to managers_path
      end
    end
  end
end
