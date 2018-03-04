class WantedConcertsController < ApplicationController
  before_action  :authenticate_user!
  before_action  :find_wanted_concert, only: :destroy

  def index
    @wanted_concerts = WantedConcert.where("user_id =?", current_user.id)
  end

  def new
    @wanted_concert = WantedConcert.new
  end

  def create
    @wanted_concert = WantedConcert.new(wanted_concerts_params)
    @wanted_concert.user_id = current_user.id
    if @wanted_concert.save!
      redirect_to wanted_concerts_path, notice: "Ton souhait est bien enregistré"
    else
      render :new , alert: "Oups recommence!"
    end
  end

  def destroy
    @wanted_concert.destroy
    respond_to do |format|
      format.html { redirect_to wanted_concerts_url, notice: 'Ton souhait a bien été supprimé' }
    end
  end

  private

  def find_wanted_concert
    @wanted_concert = WantedConcert.find(params[:id])
  end

  def wanted_concerts_params
    params.require(:wanted_concert).permit(:department, :user_id)
  end
end
