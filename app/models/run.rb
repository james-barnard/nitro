class Run < ActiveRecord::Base
  belongs_to :routes
  has_many :duds
  has_many :product_loads, through: :duds
  has_many :fulls
  has_many :local_products, through: :fulls

  validates :user_id, uniqueness: true, if: "active?"

  def active?
    status == "active"
  end
end
