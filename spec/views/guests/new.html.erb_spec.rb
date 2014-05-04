require 'spec_helper'

describe "guests/new" do
  before(:each) do
    assign(:guest, stub_model(Guest,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new guest form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", guests_path, "post" do
      assert_select "input#guest_name[name=?]", "guest[name]"
    end
  end
end
