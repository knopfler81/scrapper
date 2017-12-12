class WantedConcert < ApplicationRecord
  belongs_to :user
  validates :department, presence: true


  # def matching_concerts
  #   Concert.all.each do |concert|
  #     if self.department == concert.department
  #       WantedConcertMailer.matching_locations(concert).deliver_now
  #     end
  #   end
  # end
end
