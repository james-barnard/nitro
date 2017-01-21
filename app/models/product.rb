class Product < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  def to_label
    name.capitalize
  end
end
