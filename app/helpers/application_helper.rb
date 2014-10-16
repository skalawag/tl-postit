module ApplicationHelper
  def readable_time(time)
    if logged_in? && !current_user.time_zone.blank?
      time = time.in_time_zone(current_user.time_zone)
    end
    time.strftime("%m/%d/%Y %l:%M%P %Z")
  end
end
