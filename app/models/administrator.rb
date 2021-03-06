class Administrator < ActiveRecord::Base
  acts_as_authentic do |c|
    c.login_field = :username
  end
end

# == Schema Information
#
# Table name: administrators
#
#  id                :integer          not null, primary key
#  username          :string(255)
#  crypted_password  :string(255)
#  password_salt     :string(255)
#  persistence_token :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#
