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
    SpotHistoryData.new(
      spot: self, user_nickname: user.nickname, action: :canceled).save!

    update(book_time: nil, user_id: nil, reservation_time: nil)
  end

  def set_reservation(user, time_in_hours)
    SpotHistoryData.new(
      spot: self, reservation_time: time_in_hours,
      user_nickname: user.nickname, action: :reserved).save!
    SpotJob.set(wait_until: Time.now + time_in_hours.hours).perform_later(self)
    update(book_time: Time.now, user_id: user.id, reservation_time: time_in_hours)
  end

  def set_empty_on_booktime_end!
    SpotHistoryData.new(spot: self, action: :expired).save!
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
