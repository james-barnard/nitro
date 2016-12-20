class Brewery < ActiveRecord::Base
  belongs_to :region
  belongs_to :person
  has_many :products, through: :local_products

  def to_label
    name.capitalize
  end
end
