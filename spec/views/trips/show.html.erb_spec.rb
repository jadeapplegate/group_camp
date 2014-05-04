require 'spec_helper'

describe "trips/show" do
  before(:each) do
    @trip = assign(:trip, stub_model(Trip,
      :arrival => "Arrival",
      :departure => "Departure",
      :camp_info => "MyText",
      :share_url => "Share Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Arrival/)
    rendered.should match(/Departure/)
    rendered.should match(/MyText/)
    rendered.should match(/Share Url/)
  end
end
