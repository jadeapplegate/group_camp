class Trip < ActiveRecord::Base
  serialize :amenities
  serialize :photos

  def photos_array
    JSON.parse photos
  end

  def amenities_array
    JSON.parse amenities
  end
  
end
