class Spot < ApplicationRecord
  belongs_to :user, optional: true

  def self.create_spots(amount)
    amount.times {
      spot = Spot.new
      spot.save!
    }
  end

  def self.destroy_spots
    Spot.all.destroy_all
  end

end
