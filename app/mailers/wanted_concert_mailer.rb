class WantedConcertMailer < ApplicationMailer

default from: "concert@mountain-men.fr"



  def matching_locations(wanted)
    #wanteds =  WantedConcert.where("department = ?", wanted)
    user = wanted.user_id
    User.where(id: user).each do |user|

      mail( to: user.email,
           subject:  "Ils arrivent vers chez toi !"
          )
    end
 end
end
