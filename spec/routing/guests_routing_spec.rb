require "spec_helper"

describe GuestsController do
  describe "routing" do


    it "routes to #new" do
      get("/guests/new").should route_to("guests#new")
    end

    it "routes to #create" do
      post("/guests").should route_to("guests#create")
    end

  end
end
