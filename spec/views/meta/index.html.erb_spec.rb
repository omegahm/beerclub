require 'spec_helper'

describe "meta/index" do
  before(:each) do
    assign(:meta, [
      stub_model(Metum,
        cash: 1.5,
        loss: 1.5,
        stock: 1.5,
        created_at: Date.today
      ),
      stub_model(Metum,
        cash: 1.5,
        loss: 1.5,
        stock: 1.5,
        created_at: Date.today
      )
    ])
  end

  it "renders a list of meta" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", text: l(Date.today, format: :long), count: 2
  end
end
