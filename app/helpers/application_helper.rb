module ApplicationHelper
  def human_date date
    date.strftime("%B %d, %Y %I:%M:%S %p")
  end
end
