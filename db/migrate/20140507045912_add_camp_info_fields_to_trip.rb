class AddCampInfoFieldsToTrip < ActiveRecord::Migration
  def change
     add_column :trips, :detail_description, :text
     add_column :trips, :driving_direction, :text
     add_column :trips, :important_info, :text
     add_column :trips, :facilities_description, :text
     add_column :trips, :recreation_description, :text
     add_column :trips, :info_link, :string
     add_column :trips, :contact_number, :string
     add_column :trips, :photos, :text
     add_column :trips, :amenities, :text
     remove_column :trips, :camp_info, :text
  end
end

