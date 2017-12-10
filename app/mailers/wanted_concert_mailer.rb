class WantedConcertMailer < ApplicationMailer

  default from: "concert@mountain-men.fr"

  def matching_locations(wanted_concerts)
    @wanted_concerts = WantedConcert.all
    mail( to:   "knopfler42@yahoo.fr",
         subject:  "Ils arrivent vers chez toi !"
        )
  end
end
