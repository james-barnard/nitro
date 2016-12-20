class Region < ActiveRecord::Base
  def to_label
    name.capitalize
  end
end
