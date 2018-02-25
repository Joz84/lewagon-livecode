module ApplicationHelper
  def format_date(date_string)
    l((DateTime.parse(date_string).in_time_zone('Paris')),
      format: '%A %-d %B' ).capitalize
  end
end
