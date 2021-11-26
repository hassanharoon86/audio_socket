module AuditionHelper
  def status_value(status)
    Audition.statuses[status].to_s
  end
end
