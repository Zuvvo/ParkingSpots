class Spot < ApplicationRecord
  belongs_to :user

  def self.create_spots(amount)
    amount.times {
      spot = Spot.new(is_reserved: false)
      spot.save!
    }
  end

  def self.destroy_spots
    Spot.all.destroy_all
  end

end
