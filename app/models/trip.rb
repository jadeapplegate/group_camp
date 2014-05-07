class Trip < ActiveRecord::Base
  serialize :amenities
  serialize :photos
end
