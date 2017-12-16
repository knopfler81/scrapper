class ConcertMailer < ApplicationMailer

  default from: "concert@mountain-men.fr"

  def new_dates(concerts, users)
    @concerts = Concert.last_found
    mail( to:  users.pluck[:email] ,
         subject:  "Des nouvelles dates pour les Mountain Men"
        )
  end


end
