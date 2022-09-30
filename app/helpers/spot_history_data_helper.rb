module SpotHistoryDataHelper
  def format_date(date)
    date.localtime.strftime(time_format)
  end

  def time_format
    "%b %e %R %Y"
  end
end