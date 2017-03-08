module VendingMachinesHelper
  def start_end(period)
    "#{period.start_time.strftime('%_I:%M%P')} - #{period.end_time.strftime('%_I:%M%P')}"
  end
end
