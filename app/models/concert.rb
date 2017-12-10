
class Concert < ApplicationRecord

  scope :last_found, -> { where("concerts.created_at >= ?", 5.minutes.ago )}

end
