class ProductLoad < ActiveRecord::Base
  belongs_to :local_product
  belongs_to :vending_machine

  scope :active, -> { where(:removed_at => nil) }

  def expiration
    date_loaded + 2.weeks
  end

  def days_remaining
    (expiration.to_date - Date.today).to_i
  end

  def display
    "#{display_name}: pours remaining [NN] expires on #{expiration}"
  end

  def display_name
    local_product.to_label
  end

  def menu_name
    local_product.product.to_label
  end
end
