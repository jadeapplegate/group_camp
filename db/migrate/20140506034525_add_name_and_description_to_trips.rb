class AddNameAndDescriptionToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :name, :string
    add_column :trips, :description, :string
  end
end
