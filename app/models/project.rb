class Project < ActiveRecord::Base
  def self.iron_find(value)
    where(value).first
  end

  def self.clean_old
    where('created_at < ?', 1.week.ago).destroy_all
  end
end
