require 'rails_helper'

RSpec.describe 'users/edit' do
  before(:each) do
    @user = assign(:user, FactoryGirl.create(:user,
                                             name: 'MyString',
                                             room: 'MyString'
    ))
  end

  it 'renders the edit user form' do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select 'form[action=?][method=?]', user_path(@user), 'post' do
      assert_select 'input#user_name[name=?]', 'user[name]'
      assert_select 'input#user_room[name=?]', 'user[room]'
    end
  end
end
