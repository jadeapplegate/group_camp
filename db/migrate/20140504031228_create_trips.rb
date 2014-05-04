class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :arrival
      t.string :departure
      t.text :camp_data
      t.string :share_url

      t.timestamps
    end
  end
end
