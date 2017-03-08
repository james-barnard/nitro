module VendingMachinesHelper
  def start_end(period)
    "#{period.start_time.strftime('%H:%M')} - #{period.end_time.strftime('%H:%M')}"
  end
end
