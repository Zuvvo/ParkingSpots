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

  def self.clear_all_spots
    Spot.all.cancel_reservation
  end

  def cancel_reservation
    update(book_time: nil, user_id: nil, reservation_time: nil)
  end

  def book_time_end_in_local_time
    unless user_id.nil? || reservation_time.nil?
      (book_time.localtime + reservation_time.hours).strftime(time_format)
    end
  end

  def book_time_start_in_local_time
    unless user_id.nil? || reservation_time.nil?
      book_time.localtime.strftime(time_format)
    end
  end

  def is_reserved?
    if user_id.nil? || book_time.nil? || reservation_time.nil?
      return false
    else
      return book_time.localtime + reservation_time.hours > Time.now
    end
  end

  private

  def time_format
    "%b %e %R %Y"
  end


end
