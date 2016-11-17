class Setting < ActiveRecord::Base
  class << self
    def to_hash
      Setting.all.each_with_object({}) do |setting, hash|
        hash[setting.key.to_sym] = setting.value
      end
    end
  end
end
