class ProductLoad < ActiveRecord::Base
  belongs_to :local_product
  belongs_to :vending_machine

  def expiration
    date_loaded + 2.weeks
  end
end
