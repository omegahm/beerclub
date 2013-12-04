class Metum < ActiveRecord::Base
  validates :cash, :loss, :stock, presence: true

  def self.last_month
    Metum.order('created_at DESC').first.presence || { loss: 0, cash: 0, stock: 0 }
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
