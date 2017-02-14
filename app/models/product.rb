class Product < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  mount_uploader :thumbnail, ImageUploader

  def to_label
    name.capitalize
  end
end
