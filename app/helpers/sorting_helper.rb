module SortingHelper
  def sortable(column_name)
    if params[:sorting_column] == column_name && params[:sorting_direction] == 'ASC'
      'DESC'
    else
      'ASC'
    end
  end
end
