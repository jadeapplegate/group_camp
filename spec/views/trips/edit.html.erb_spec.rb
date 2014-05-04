require 'spec_helper'

describe "trips/edit" do
  before(:each) do
    @trip = assign(:trip, stub_model(Trip,
      :arrival => "MyString",
      :departure => "MyString",
      :camp_info => "MyText",
      :share_url => "MyString"
    ))
  end

  it "renders the edit trip form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", trip_path(@trip), "post" do
      assert_select "input#trip_arrival[name=?]", "trip[arrival]"
      assert_select "input#trip_departure[name=?]", "trip[departure]"
      assert_select "textarea#trip_camp_info[name=?]", "trip[camp_info]"
      assert_select "input#trip_share_url[name=?]", "trip[share_url]"
    end
  end
end
