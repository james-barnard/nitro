class FreePeriod < ActiveRecord::Base
  belongs_to :vending_machine

  def contains?(time)
    time.between?(start_time, end_time)
  end
end
