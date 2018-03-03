
class Concert < ApplicationRecord

  scope :last_found, -> { where("concerts.created_at >= ?", 1.second.ago ) }


  def department
    self.city[/\(.*?\)/].gsub(/[()]/, "").to_i
  end

  def city_name
    self.city[/^[^\(]+/].rstrip!
  end

  def location_name
    self.city[/\|(.*)/].gsub("|", "").strip
  end


  def date_day
    self.date[/^[0-9]{1,2}/]
  end

  def date_month
    self.date[/[a-zA-z]+/]
  end

  def date_year
    self.date[/[0-9]{4}$/]
  end

end

