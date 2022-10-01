class SpotJob < ApplicationJob
  queue_as :default

  def perform(spot)

    return unless spot.is_reserved?

    return if (spot.book_time + reservation_time.hours) < Time.current

    spot.set_empty_on_booktime_end!
  end
end
