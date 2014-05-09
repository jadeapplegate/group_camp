require 'spec_helper'

  describe "Home Index" do

    # root_path
    describe "GET /" do
    it "should be a 200 response" do
      get "/"
      response.status.should be(200)
    end
  end
end

