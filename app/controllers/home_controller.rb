# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :check_user_status, only: [:index]

  def index; end

  private

  def check_user_status
    if current_user&.manager?
      redirect_to managers_path
    elsif current_user&.artist?
      redirect_to artists_path
    end
  end
end
