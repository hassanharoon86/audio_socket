class HomeController < ApplicationController
  def index
    if user_signed_in?
      if current_user.manager?
        redirect_to managers_path
      elsif current_user.artist?
        redirect_to artists_path
      end
    end
  end
end
