module ScopingHelper
  def scopable(scope)
    if scope == 'All'
      link_to scope + ' (' + @auditions.count.to_s + ')', scope: scope, query: params[:query], sorting_column: params[:sorting_column], sorting_direction: params[:sorting_direction], remote: true
    elsif scope == 'Pending'
      link_to scope + ' (' + @auditions.pending.count.to_s + ')', scope: scope, query: params[:query], sorting_column: params[:sorting_column], sorting_direction: params[:sorting_direction], remote: true
    elsif scope == 'Approved'
      link_to scope + ' (' + @auditions.accepted.count.to_s + ')', scope: scope, query: params[:query], sorting_column: params[:sorting_column], sorting_direction: params[:sorting_direction], remote: true
    elsif scope == 'Rejected'
      link_to scope + ' (' + @auditions.rejected.count.to_s + ')', scope: scope, query: params[:query], sorting_column: params[:sorting_column], sorting_direction: params[:sorting_direction], remote: true
    elsif scope == 'Deleted'
      link_to scope + ' (' + @auditions.deleted.count.to_s + ')', scope: scope, query: params[:query], sorting_column: params[:sorting_column], sorting_direction: params[:sorting_direction], remote: true
    end
  end
end
