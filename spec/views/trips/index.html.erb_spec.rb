require 'spec_helper'

describe "trips/index" do
  before(:each) do
    assign(:trips, [
      stub_model(Trip,
        :arrival => "Arrival",
        :departure => "Departure",
        :camp_info => "MyText",
        :share_url => "Share Url"
      ),
      stub_model(Trip,
        :arrival => "Arrival",
        :departure => "Departure",
        :camp_info => "MyText",
        :share_url => "Share Url"
      )
    ])
  end

  it "renders a list of trips" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Arrival".to_s, :count => 2
    assert_select "tr>td", :text => "Departure".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Share Url".to_s, :count => 2
  end
end
