require "nokogiri"
require "open-uri"
require "date"
require "time"

namespace :scrap do
  desc "This get MM concerts"

    url = "http://mountain-men.fr/concerts/"
    doc = Nokogiri::HTML(open(url))
    data = doc.search('#dateconcert table')
    data = data.css('.jaunec' ).map { |tr| tr.css('td').map(&:text) } + doc.css('.jaunef' ).map { |tr| tr.css('td').map(&:text) }

  task :find_concerts  => :environment do

    data.each do |concert|
      c = Concert.new
      c.date = concert[0]
      c.city = concert[1]
      c.save
    end

  end

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
end

