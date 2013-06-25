class Payment < ActiveRecord::Base
  belongs_to :user

  validates :user_id, :amount, presence: true
end

# == Schema Information
#
# Table name: payments
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  amount     :float
#  created_at :datetime
#  updated_at :datetime
#

