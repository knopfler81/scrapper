class WantedConcertsController < ApplicationController
  before_action  :authenticate_user!

  def index
    @wanted_concerts = WantedConcert.all#.where('user_id =?', current_user)
  end

  def new
    @wanted_concert = WantedConcert.new
  end

  def create
    @wanted_concert = WantedConcert.new(wanted_concerts_params)
    @wanted_concert.user_id = current_user.id

    respond_to do |format|
      if @wanted_concert.save
        format.html { redirect_to wanted_concerts_path, notice: "Bien enregistré" }
      else
        format.html { render :new , alert: "Oups recommence!" }
      end
    end
  end

  private

  def wanted_concerts_params
    params.require(:wanted_concert).permit(:department, :user_id)
  end
end
