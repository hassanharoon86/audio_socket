module AuditionHelper
  def status_value(status)
    Audition.statuses[status]
  end
end
