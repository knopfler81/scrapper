class ConcertMailer < ApplicationMailer

  default from: "concert@mountain-men.fr"

  def new_dates(concerts)
    @concerts = Concert.where('created_at > ?', 1.minutes.ago )
    mail( to:   "knopfler42@yahoo.fr",
         subject:  "Chouette, Les MM font un concert bientôt"
        )
  end
end
