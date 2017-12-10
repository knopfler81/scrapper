
class Concert < ApplicationRecord


  scope :last_found, -> { where("concerts.created_at >= ?", 5.minutes.ago )}


  def retreive_department
    self.city[/\(.*?\)/].gsub(/[()]/, "").to_i
  end



end
