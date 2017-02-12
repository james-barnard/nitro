class Product < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  mount_uploader :thumb, ImageUploader

  def to_label
    name.capitalize
  end
end
