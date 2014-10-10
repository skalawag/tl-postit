module ApplicationHelper
  def readable_time(time)
    time.strftime("%m/%d/%Y %l:%M%P %Z")
  end
end
