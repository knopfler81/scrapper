
class Concert < ApplicationRecord


  scope :last_found, -> { where("concerts.created_at >= ?", 5.minutes.ago )}


  def department
    self.city[/\(.*?\)/].gsub(/[()]/, "").to_i
  end

  def city_name
    self.city[/^[^\(]+/].rstrip!
  end

  def location_name
     self.city[/\|(.*)/].gsub("|", "").strip
  end

  # def matching_concerts
  #   WantedConcert.each do |wanted|
  #     if wanted.department == self.department
  #       ConcertMailer.matching_locations(wanted).deliver_now
  #     end
  #   end
  # end
end
