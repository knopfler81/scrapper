class ConcertMailer < ApplicationMailer

  default from: "concert@mountain-men.fr"

  def new_dates(concert)
     @concert = concert
      mail(
        to:   "knopfler42@yaoo.fr",
        subject:  " Chouette, Les MM font un concert à #{concert.city} bientôt"
            )

  end
end
