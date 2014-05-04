require 'spec_helper'

describe "guests/edit" do
  before(:each) do
    @guest = assign(:guest, stub_model(Guest,
      :name => "MyString"
    ))
  end

  it "renders the edit guest form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", guest_path(@guest), "post" do
      assert_select "input#guest_name[name=?]", "guest[name]"
    end
  end
end
