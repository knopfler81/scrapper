class ConcertMailer < ApplicationMailer

  default from: "concert@mountain-men.fr"

  def new_dates(concerts)
    @concerts = Concert.last_found
    mail( to:   "knopfler42@yahoo.fr",
         subject:  "Chouette, Les MM font un concert bientôt"
        )
  end
end
