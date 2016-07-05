class ProductLoad < ActiveRecord::Base
  belongs_to :local_product
  belongs_to :vending_machine
end
