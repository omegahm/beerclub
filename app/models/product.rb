class Product < ActiveRecord::Base
  has_many :bills

  validates :name, :price, presence: true

  scope :visible, -> { where(visible: true) }
end

# == Schema Information
#
# Table name: products
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  price      :float
#  visible    :boolean          default(TRUE)
#  created_at :datetime
#  updated_at :datetime
#
