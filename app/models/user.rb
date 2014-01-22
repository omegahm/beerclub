class User < ActiveRecord::Base
  DEPOSIT_FEE = 50.0

  has_many :bills
  has_many :payments

  after_create :create_deposit_fee

  validates :name, :room, presence: true

  scope :visible, -> { where(visible: true) }

  # Order by room with 400 coming first, after that every other 3 digit, and then 4 digits and above
  scope :order_by_room, lambda {
    order("visible DESC, CASE SUBSTR(users.room, 1, 1)
                         WHEN '4' THEN users.room
                         ELSE (LPAD(LPAD(users.room, 10, '0'), 20, 'z'))
                         END")
  }

  def create_deposit_fee
    Payment.create(user_id: id, amount: -DEPOSIT_FEE)
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
