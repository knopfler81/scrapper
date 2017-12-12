class WantedConcert < ApplicationRecord
  belongs_to :user
  validates :department, presence: true


  def matching_concerts
    Concert.all.each do |concert|
      if self.department == concert.retreive_department
        WantedConcertMailer.matching_locations(self).deliver_now
      end
    end
  end
end
