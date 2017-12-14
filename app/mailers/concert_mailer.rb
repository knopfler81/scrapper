class ConcertMailer < ApplicationMailer

  default from: "concert@mountain-men.fr"

  def new_dates(concerts)
    @concerts = Concert.last_found
    @users = User.all
    mail( to:  "knopfler42@yahoo.fr", #@users.each { |user| user.email },
         subject:  "Des nouvelles dates pour les Mountain Men"
        )
  end

    def matching_locations(concerts)
      @concerts = Concert.last_found
      mail( to:   "knopfler42@yahoo.fr",
           subject:  "Ils arrivent vers chez toi !"
          )
    end
end
