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

  before_save :fix_ampersand

  def photos_array
    JSON.parse photos
  end

  def amenities_array
    JSON.parse amenities
  end

  private
    def fix_ampersand
      self.class
    end
end


class Topic < ActiveRecord::Base
  before_destroy :delete_parents

  private
    def delete_parents
      self.class.delete_all "parent_id = #{id}"
    end
end