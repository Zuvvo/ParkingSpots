class SpotJob < ApplicationJob
  queue_as :default

  def perform(spot)
    return unless spot.is_reserved?

    return if (spot.book_time + spot.reservation_time.hours) < Time.now

    spot.set_empty_on_booktime_end!
  end
end
