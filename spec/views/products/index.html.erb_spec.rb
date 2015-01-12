require 'rails_helper'

RSpec.describe 'products/index' do
  before(:each) do
    assign(:products, [
      FactoryGirl.create(:product),
      FactoryGirl.create(:product)
    ])
  end

  it 'renders a list of products' do
    render
  end
end
