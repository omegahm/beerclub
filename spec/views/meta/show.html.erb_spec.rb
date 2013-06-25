require 'spec_helper'

describe "meta/show" do
  before(:each) do
    @metum = assign(:metum, stub_model(Metum,
      :cash => 1.5,
      :loss => 1.5,
      :stock => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
  end
end
