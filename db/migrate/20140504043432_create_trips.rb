class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      # t.string :destination
      t.string :arrival
      t.string :departure
      t.text :camp_info
      t.string :share_url

      t.timestamps
    end
  end
end
