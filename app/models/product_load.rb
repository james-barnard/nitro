class ProductLoad < ActiveRecord::Base
  belongs_to :local_product
  belongs_to :vending_machine

  def expiration
    date_loaded + 2.weeks
  end

  def days_remaining
    (expiration.to_date - Date.today).to_i
  end
end
