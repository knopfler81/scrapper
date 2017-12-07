
class Concert < ApplicationRecord
  after_create :send_notification

  def send_notification
    ConcertMailer.new_dates(self).deliver_now
  end

  def group_new_concerts
    Concert.where('created_at < ?', 1.minute.ago )
  end
end
