class HomeController < ApplicationController
  # before_action :authenticate_user!

  def index
    if user_signed_in?
      if current_user.role == 'manager'
        puts "I am manager"
        redirect_to manager_index_path
      else
        redirect_to artist_index_path
      end
    end
  end
end
