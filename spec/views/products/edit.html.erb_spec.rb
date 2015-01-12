require 'rails_helper'

RSpec.describe 'products/edit' do
  before(:each) do
    @product = assign(:product, FactoryGirl.create(:product))
  end

  it 'renders the edit product form' do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select 'form[action=?][method=?]', product_path(@product), 'post' do
    end
  end
end
