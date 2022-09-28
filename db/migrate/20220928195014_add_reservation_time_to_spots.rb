class AddReservationTimeToSpots < ActiveRecord::Migration[7.0]
  def change
    add_column :spots, :reservation_time, :integer
  end
end
