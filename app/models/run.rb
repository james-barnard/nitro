class Run < ActiveRecord::Base
  belongs_to :routes
  belongs_to :user
  has_many :duds
  has_many :product_loads, through: :duds
  has_many :fulls
  has_many :local_products, through: :fulls

  validates :user_id, uniqueness: true, if: "active?"

  def self.active(user)
    where(user_id: user.id, status: "active").first
  end

  def active?
    status == "active"
  end
end
