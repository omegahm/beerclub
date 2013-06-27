require 'spec_helper'

describe User do
  it "orders by room" do
    @user1 = FactoryGirl.create(:user, room: '410')
    @user2 = FactoryGirl.create(:user, room: '401')
    @user3 = FactoryGirl.create(:user, room: 'x410')
    @user4 = FactoryGirl.create(:user, room: 'Buddy')
    @user5 = FactoryGirl.create(:user, room: '202')
    @user6 = FactoryGirl.create(:user, room: '1501')

    User.order_by_room.map(&:room).should == ['401', '410', '202', '1501', 'x410', 'Buddy']
  end

  it "should create deposit" do
    @user1 = FactoryGirl.create(:user, room: '410')
    @user1.payments.sum(:amount).should == -50.0
  end
end

# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  room       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  visible    :boolean          default(TRUE)
#  temp_id    :integer
#

