class Trip < ActiveRecord::Base
  belongs_to :user
  has_many :guests

  validates :arrival, presence: true
  validates :departure, presence: true
  validates :name, presence: true
  validates :description, presence: true
  # validates :share_url, presence: true, uniqueness: true

  serialize :amenities
  serialize :photos

  def photos_array
    JSON.parse photos
  end

  def amenities_array
    JSON.parse amenities
  end

end
