require 'rails_helper'

RSpec.describe 'users/index' do
  before(:each) do
    assign(:users, [
      FactoryGirl.create(:user,
                         name: 'Name',
                         room: 'Room'
      ),
      FactoryGirl.create(:user,
                         name: 'Name',
                         room: 'Room'
      )
    ])
  end

  it 'renders a list of users' do
    render
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
    assert_select 'tr>td', text: 'Room'.to_s, count: 2
  end
end
