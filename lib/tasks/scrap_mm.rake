namespace :scrap do
  desc "This scrap MM concerts"

  task :mountain_men  => :environment do

    require "nokogiri"
    require "open-uri"
    require "date"
    require "time"
    url = "http://mountain-men.fr/concerts/"

    doc = Nokogiri::HTML(open(url))
    data = doc.search('#dateconcert table')
    data = data.css('.jaunec' ).map { |tr| tr.css('td').map(&:text) } + doc.css('.jaunef' ).map { |tr| tr.css('td').map(&:text) }

    data.each do |concert|
      c = Concert.new
      c.date = concert[0]
      c.city = concert[1]
      c.save
    end
  end
end
