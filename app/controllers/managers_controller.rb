# frozen_string_literal: true

class ManagersController < ApplicationController
  before_action :authenticate_user!
  before_action :verify_manager_user
  before_action :auditions

  def index
    @auditions = SortingService.new(@auditions, params).call

    respond_to do |format|
      format.html
      format.js
      format.csv { send_data CsvGeneratorService.new(@auditions).call, filename: csv_filename }
    end
  end

  private

  def auditions
    @auditions = Audition.all
  end

  def csv_filename
    file_name = 'auditions'
    file_name += "-#{params[:scope]}" if params[:scope].present?
    file_name += "-#{params[:query]}" if params[:query].present?
    file_name += "-#{Date.today}.csv"
  end
end
