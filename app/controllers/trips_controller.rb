class TripsController < ApplicationController

  # GET /trips/:share_url
  def show
    @trip = Trip.find_by_share_url params[:share_url]
    @guest = Guest.new
    @guests = @trip.guests 
    #@guests = Guest.find_by_trip_id @trip.id 
  end

  #GET /trips/search
  def search
    @user = current_user
  end
  
  #GET /trips/results
  def results
    @park_name = params[:park_name].gsub(" ", "+")
    results = Typhoeus.get("http://api.amp.active.com/camping/campgrounds/?pname=#{@park_name}&api_key=#{ENV['API_KEY']}")
    campgrounds_results = Hash.from_xml(results.body)
    campground_data = campgrounds_results['resultset']['result']
    if campground_data.is_a?(Array)
      @campgrounds = campground_data.map do |facility|
        {name: facility['facilityName'].titleize, facility_id: facility['facilityID'], contract_id: facility['contractID']}
      end
    else
      @campgrounds = [{name: campground_data['facilityName'].titleize, facility_id: campground_data['facilityID'], contract_id: campground_data['contractID']}]
    end
  end

  #GET /trips/new
  def new
    @trip = Trip.new
    @contract_id = params[:contract_id]
    @facility_id = params[:facility_id]
    results = Typhoeus.get("http://api.amp.active.com/camping/campground/details?contractCode=#{@contract_id}&parkId=#{@facility_id}&api_key=#{ENV['API_KEY']}")
    @park_details = Hash.from_xml(results.body)
    @description = @park_details['detailDescription']['description']
    @driving_direction = @park_details['detailDescription']['drivingDirection']
    @important_info = @park_details['detailDescription']['importantInformation']
    @facilities_description = @park_details['detailDescription']['facilitiesDescription']
    @recreation_description = @park_details['detailDescription']['recreationDescription']
    links = @park_details['detailDescription']['informationLink']
    @info_link =  links.is_a?(Array) ? links[0]['link'] : nil 
    @contact_number = @park_details['detailDescription']['contact'][0]['number']
    photos = @park_details['detailDescription']['photo']
    @photos = photos.is_a?(Array) ? photos.map {|photo| 'http://www.reserveamerica.com' + photo['realUrl']} : nil
    amenities = @park_details['detailDescription']['amenity']
    @amenities = amenities.is_a?(Array) ? amenities.map {|amenity| amenity['name']} : nil 
  end

  # POST /trips
  def create
    @trip = Trip.new trip_params
    @trip.share_url = SecureRandom.urlsafe_base64(16)
    @trip.user_id = current_user.id
      if @trip.save
        redirect_to trip_url(@trip.share_url)
      else
      error_messages = @trip.errors.messages.values.flatten
      flash.now[:errors] = error_messages
      render action: "new"
      end
  end

  # DELETE /trips/1
  def destroy
    @trip = Trip.find params[:id]
    @trip.destroy
    respond_to do |format|
      format.html { redirect_to trips_url }
    end
  end

  private
    def trip_params
      params.require(:trip).permit(:arrival, :departure, :share_url, :name, :description, :detail_description, :driving_direction, :important_info, :facilities_description, :recreation_description, :info_link, :contact_number, :photos, :amenities)
    end

end
