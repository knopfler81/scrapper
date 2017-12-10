require "nokogiri"
require "open-uri"
require "date"
require "time"

namespace :scrap do

    url = "http://mountain-men.fr/concerts/"
    doc = Nokogiri::HTML(open(url))
    data = doc.search('#dateconcert table')
    data = data.css('.jaunec' ).map { |tr| tr.css('td').map(&:text) } + doc.css('.jaunef' ).map { |tr| tr.css('td').map(&:text) }

  desc "Première récupération des dates"
  task :find_concerts  => :environment do

    data.each do |concert|
      c = Concert.new
      c.date = concert[0]
      c.city = concert[1]
      c.save
    end

  end

  desc "Mise à jour des nouvelles dates"
  task :update_concerts  => :environment do

    existing_date = Concert.all.map { |c| [c.date, c.city] }


    data.each do |concert|
      c = Concert.new
      c.date = concert[0]
      c.city = concert[1]
      c.save unless existing_date.include?([concert[0], concert[1]])
    end

    Concert.where(city: nil, date:nil).destroy_all

  end

  desc "Envoie email si nouvelles dates"
  task :detected_new_dates => :environment do
    new_concerts = Concert.last_found
    ConcertMailer.new_dates(new_concerts).deliver_now unless new_concerts.count  == 0
  end
end

