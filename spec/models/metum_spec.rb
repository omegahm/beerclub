require 'spec_helper'

describe Metum do
  it "gets the last month" do
    @metum1 = FactoryGirl.create(:metum, cash: 102.0, loss: 12.0, stock: 1200.0, created_at: Date.today)
    @metum2 = FactoryGirl.create(:metum, created_at: 1.month.ago)
    Metum.last_month.should == @metum1
  end
end

# == Schema Information
#
# Table name: meta
#
#  id         :integer          not null, primary key
#  cash       :float
#  loss       :float
#  stock      :float
#  created_at :datetime
#  updated_at :datetime
#

