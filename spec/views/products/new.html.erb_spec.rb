require 'rails_helper'

RSpec.describe 'products/new' do
  before(:each) do
    assign(:product, FactoryGirl.build(:product, id: nil))
  end

  it 'renders new product form' do
    render
    assert_select 'form[action=?][method=?]', products_path, 'post' do
    end
  end
end
