class FreePeriod < ActiveRecord::Base
  belongs_to :vending_machine

  def contains?(time)
    puts "contains: #{start_time} < #{time} < #{end_time} #{time.between?(start_time, end_time)}"
    time.between?(start_time, end_time)
  end
end
