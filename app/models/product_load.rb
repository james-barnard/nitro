class ProductLoad < ActiveRecord::Base
  belongs_to :local_product
  belongs_to :vending_machine
  has_many   :purchases
  has_many   :fb_users, through: :purchases

  scope :active, -> { where(:removed_at => nil) }

  def self.find_by_pour(vending_machine_id:, valve:)
    where(vending_machine_id: vending_machine_id, valve: valve)
  end

  def expiration
    date_loaded + 2.weeks
  end

  def days_remaining
    (expiration.to_date - Date.today).to_i
  end

  def pours_remaining
    total_pours - poured
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

  def menu_thumb
    local_product.product.thumbnail.url
  end
end
