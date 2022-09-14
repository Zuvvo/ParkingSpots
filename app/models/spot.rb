class Spot < ApplicationRecord

  def self.create_spots(amount)
    amount.times {
      spot = Spot.new(is_reserved: false)
      spot.save!
    }
  end

  def self.destroy_spots
    Spot.all.each {|x| x.destroy }
  end
end