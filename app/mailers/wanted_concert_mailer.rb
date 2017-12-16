class WantedConcertMailer < ApplicationMailer

default from: "concert@mountain-men.fr"

  def matching_locations(wanted)

    mail( to:   "knopfler42@yahoo.fr",
         subject:  "Ils arrivent vers chez toi !"
        )
  end
end
