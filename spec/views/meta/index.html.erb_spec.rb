require 'spec_helper'

describe "meta/index" do
  before(:each) do
    assign(:meta, [
      stub_model(Metum,
        :cash => 1.5,
        :loss => 1.5,
        :stock => 1.5
      ),
      stub_model(Metum,
        :cash => 1.5,
        :loss => 1.5,
        :stock => 1.5
      )
    ])
  end

  it "renders a list of meta" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
