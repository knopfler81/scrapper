
class Concert < ApplicationRecord


  scope :last_found, -> { where("concerts.created_at >= ?", 1.seconds.ago ) }
  #scope :last_match, -> { joins(WantedConcert.where("department =?",) }


  def department
    self.city[/\(.*?\)/].gsub(/[()]/, "").to_i
  end

  def city_name
    self.city[/^[^\(]+/].rstrip!
  end

  def location_name
    self.city[/\|(.*)/].gsub("|", "").strip
  end

end

