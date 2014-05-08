class AddTripRefToGuests < ActiveRecord::Migration
  def change
    add_reference :guests, :trip, index: true
  end
end
