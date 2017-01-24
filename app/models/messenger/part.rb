module Messenger
  class Part < ActiveRecord::Base
    belongs_to :fb_user
  end
end
