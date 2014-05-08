class GuestsController < ApplicationController
  before_action :set_guest, only: [:show, :edit, :update, :destroy]
  
  # GET /guests/new
  def new
    @guest = Guest.new
  end

  # POST /guests
  # POST /guests.json
  def create
    @guest = Guest.new(guest_params)
    respond_to do |format|
      if @guest.save
        share_url = Trip.find(@guest.trip_id).share_url
        format.html { redirect_to trip_url(share_url), notice: 'Guest was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_guest
      @guest = Guest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def guest_params
      params.require(:guest).permit(:name, :trip_id)
    end
end
