module SortingHelper
  def sortable(column_name)
    if params[:sorting_column] == column_name && params[:sorting_direction] == 'ASC'
      'DESC'
    else
      'ASC'
    end
  end

  def get_sort_icon(column_name)
    # byebug
    if params[:sorting_column] == column_name && params[:sorting_direction] == 'ASC'
      content_tag(:i, nil, class: ["fas", "fa-sort-down", "sort-color"])
      # <i class="fas fa-sort-down sort-color"></i>
    elsif params[:sorting_column] == column_name && params[:sorting_direction] == 'DESC'
      content_tag(:i, nil, class: ["fas", "fa-sort-up", "sort-color"])
      # <i class="fas fa-sort-up sort-color"></i>
    else
      content_tag(:i, nil, class: ["fas", "fa-sort", "sort-color"])
      # <i class="fas fa-sort sort-color"></i>
    end
  end
end
