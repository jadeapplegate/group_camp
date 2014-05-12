class GuestsController < ApplicationController
  before_action :set_guest, only: [:destroy]
  
  # POST /guests
  def create
    @guest = Guest.new(guest_params)
    share_url = Trip.find(@guest.trip_id).share_url
    respond_to do |format|
      if @guest.save
        format.html { redirect_to trip_url(share_url), notice: 'Guest was successfully created.' }
      else
        format.html { redirect_to trip_url(share_url) }
      end
    end
  end

  private
    def set_guest
      @guest = Guest.find(params[:id])
    end

    def guest_params
      params.require(:guest).permit(:name, :trip_id)
    end
end
