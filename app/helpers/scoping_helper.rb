module ScopingHelper
  def scopable(scope)
    if scope == 'All'
      link_to scope + ' (' + Audition.count.to_s + ')', scope: scope, remote: true
    elsif scope == 'Pending'
      link_to scope + ' (' + Audition.pending.count.to_s + ')', scope: scope, remote: true
    elsif scope == 'Approved'
      link_to scope + ' (' + Audition.accepted.count.to_s + ')', scope: scope, remote: true
    elsif scope == 'Rejected'
      link_to scope + ' (' + Audition.rejected.count.to_s + ')', scope: scope, remote: true
    elsif scope == 'Deleted'
      link_to scope + ' (' + Audition.deleted.count.to_s + ')', scope: scope, remote: true
    end
  end
end
