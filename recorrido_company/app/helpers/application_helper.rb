module ApplicationHelper
  DAY_INDEX = {
    "monday" => 0,
    "tuesday" => 1,
    "wednesday" => 2,
    "thursday" => 3,
    "friday" => 4,
    "saturday" => 5,
    "sunday" => 6
  }.freeze

  def day_name_to_index(day_name)
    DAY_INDEX[day_name.downcase]
  end

  def adjusted_day_name(day_index)
    adjusted_index = (day_index + 1) % 7
    Date::DAYNAMES[adjusted_index]
  end

  def formatted_week_range(start_date, end_date)
    "#{start_date.strftime('%B %d, %Y')} - #{end_date.strftime('%B %d, %Y')}"
  end
end
