class TripsController < ApplicationController

  # GET /trips
  def index
    @trips = Trip.all
  end

  # GET /trips/1
  def show
    @trip = Trip.find params[:id]
  end

  # GET /trips/new
  def new
    @trip = Trip.new
  end

  def results
    @park_name = params[:park_name]
    results = Typhoeus.get("http://api.amp.active.com/camping/campgrounds/?pname=#{@park_name}&api_key=#{ENV['API_KEY']}", followlocation: true)
    campgrounds_results = Hash.from_xml(results.body)
    # raise campgrounds_results.to_s
    # binding.pry
    # campgrounds_results['resultset']['result'][0]['facilityName']
    @campgrounds = campgrounds_results['resultset']['result'].map do |facility|
      #[facility['facilityName'].titleize, facility['contractID']]
      {name: facility['facilityName'].titleize, id: facility['contractID']}
    end


  end

  # POST /trips
  def create
    @trip = Trip.new(trip_params)

    respond_to do |format|
      if @trip.save
        format.html { redirect_to @trip, notice: 'Trip was successfully created.' }
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
  # DELETE /trips/1.json
  def destroy
    @trip = Trip.find params[:id]
    @trip.destroy
    respond_to do |format|
      format.html { redirect_to trips_url }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    # def trip_params
    #   params.require(:trip).permit(:arrival, :departure, :camp_info, :share_url)
    # end
end
