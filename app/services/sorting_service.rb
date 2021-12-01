# frozen_string_literal: true

class SortingService
  attr_accessor :records, :params

  def initialize(records, params)
    @records = records
    @params = params
  end

  def call
    search
    order
    scope
    records
  end

  private

  def search
    self.records = records.search(params[:query]) if params[:query].present?
  end

  def order
    self.records = records.reorder(params[:sorting_column] => params[:sorting_direction]) if params[:sorting_column]
  end

  def scope
    self.records = records.send(params[:scope]) if params[:scope].in? Audition.statuses
  end
end
