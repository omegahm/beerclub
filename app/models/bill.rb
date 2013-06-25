class Bill < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  validates :user_id, :product_id, :price, :quantity, presence: true
end

# == Schema Information
#
# Table name: bills
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  product_id :integer
#  price      :float
#  quantity   :integer
#  created_at :datetime
#  updated_at :datetime
#

