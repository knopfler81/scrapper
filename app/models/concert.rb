
class Concert < ApplicationRecord
   after_create :send_notification

   def send_notification
    ConcertMailer.new_dates(self).deliver_now
   end
end
