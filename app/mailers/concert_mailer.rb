class ConcertMailer < ApplicationMailer

  default from: "concert@mountain-men.fr"
  USERS = User.all

  def new_dates(concerts)
    @concerts = Concert.last_found

    mail( to:  USERS.pluck(:email),
         subject:  "Des nouvelles dates pour les Mountain Men"
        )
  end


end
