
class Concert < ApplicationRecord


  scope :last_found, -> { where("concerts.created_at >= ?", 5.minutes.ago )}


  def retreive_department
    self.city[/\(.*?\)/].gsub(/[()]/, "").to_i
  end

  def retreive_city_name
    self.city[/^[^\(]+/].rstrip!
  end

  def retreive_location_name
     self.city[/\|(.*)/].gsub("|", "").strip
  end



end
