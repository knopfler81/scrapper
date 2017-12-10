class ConcertMailer < ApplicationMailer

  default from: "concert@mountain-men.fr"

  def new_dates(concerts)
    @concerts = Concert.last_found
    @users = User.all
    mail( to: @users.each { |user| user.email },
         subject:  "Des nouvelles dates pour les Mountain Men"
        )
  end
end
