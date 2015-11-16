class Project < ActiveRecord::Base
  def self.iron_find(value)
    where(value).first
  end
end
