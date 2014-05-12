# require 'spec_helper'

# describe "Trips" do

#   # trips_search_path
#   describe "GET trips/search" do
#     it "should be a 200 response" do
#       get "/trips/search"
#       response.status.should be(200)
#     end
#   end

#   # trips_results_path
#   describe "GET trips/results" do
#     it "should be a 200 response" do
#       get "/trips/results"
#       response.status.should be(200)
#     end
#   end
  
# end


# trips_search  GET    /trips/search(.:format)    trips#search
# trips_results GET    /trips/results(.:format)    trips#results
# new_trip GET    /trips/new(.:format)        trips#new  ### not using this path??
#         trips POST   /trips(.:format)            trips#create
#               DELETE /trips/:id(.:format)        trips#destroy
#          trip GET    /trips/:share_url(.:format) trips#show
