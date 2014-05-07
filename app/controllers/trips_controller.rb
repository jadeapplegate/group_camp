class TripsController < ApplicationController

  # GET /trips
  def index
    @trips = Trip.all
  end

  # GET /trips/1
  def show
    @trip = Trip.find_by_share_url params[:share_url]
  end
  
  def results
    @park_name = params[:park_name]
    results = Typhoeus.get("http://api.amp.active.com/camping/campgrounds/?pname=#{@park_name}&api_key=#{ENV['API_KEY']}")
    campgrounds_results = Hash.from_xml(results.body)
    @campgrounds = campgrounds_results['resultset']['result'].map do |facility|
      {name: facility['facilityName'].titleize, facility_id: facility['facilityID'], contract_id: facility['contractID']}
    end
  end

  #GET /trips/new
  # change park_details to camp_info
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
    @info_link = @park_details['detailDescription']['informationLink'][0]['link']
    @contact_number = @park_details['detailDescription']['contact'][0]['number']
    @photos = @park_details['detailDescription']['photo'].map {|photo| 'http://www.reserveamerica.com' + photo['realUrl']}
    @amenities = @park_details['detailDescription']['amenity'].map {|amenity| amenity['name']} 
  end

  # POST /trips
  def create
    @trip = Trip.new trip_params
    @trip.share_url = SecureRandom.urlsafe_base64(16)
    respond_to do |format|
      if @trip.save
        format.html { redirect_to trip_url(@trip.share_url), notice: 'Trip was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /trips/1
  def update
    @trip = Trip.find params[:id]
    respond_to do |format|
      if @trip.update(trip_params)
        format.html { redirect_to @trip, notice: 'Trip was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
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
    # Never trust parameters from the scary internet, only allow the white list through.
    def trip_params
      params.require(:trip).permit(:arrival, :departure, :share_url, :name, :description, :detail_description, :driving_direction, :important_info, :facilities_description, :recreation_description, :info_link, :contact_number, :photos, :amenities)
    end
end
