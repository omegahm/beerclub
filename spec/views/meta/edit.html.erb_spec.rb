require 'spec_helper'

describe "meta/edit" do
  before(:each) do
    @metum = assign(:metum, stub_model(Metum,
      :cash => 1.5,
      :loss => 1.5,
      :stock => 1.5
    ))
  end

  it "renders the edit metum form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", metum_path(@metum), "post" do
      assert_select "input#metum_cash[name=?]", "metum[cash]"
      assert_select "input#metum_loss[name=?]", "metum[loss]"
      assert_select "input#metum_stock[name=?]", "metum[stock]"
    end
  end
end
