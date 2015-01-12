require 'rails_helper'

RSpec.describe 'meta/new' do
  before(:each) do
    assign(:metum, FactoryGirl.build(:metum,
                                     id: nil,
                                     cash: 1.5,
                                     loss: 1.5,
                                     stock: 1.5
    ))
  end

  it 'renders new metum form' do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select 'form[action=?][method=?]', meta_path, 'post' do
      assert_select 'input#metum_cash[name=?]', 'metum[cash]'
      assert_select 'input#metum_loss[name=?]', 'metum[loss]'
      assert_select 'input#metum_stock[name=?]', 'metum[stock]'
    end
  end
end
