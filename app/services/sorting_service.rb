# frozen_string_literal: true

class SortingService
  attr_accessor :records, :params

  def initialize(records, params)
    @records = records
    @params = params
  end

  def call
    self.records = records.search(params[:query]) if params[:query].present?

    self.records = records.order(params[:sorting_column] => params[:sorting_direction]) if params[:sorting_column].present?

    if params[:scope].in? Audition.statuses
      self.records = records.pending if params[:scope] == 'pending'
      self.records = records.accepted if params[:scope] == 'accepted'
      self.records = records.rejected if params[:scope] == 'rejected'
      self.records = records.deleted if params[:scope] == 'deleted'
    end
    records
  end
end
