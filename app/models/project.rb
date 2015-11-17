class Project < ActiveRecord::Base
  has_many(:entries)

  def self.iron_find(value)
    where(value).first
  end

  def self.clean_old
    where('created_at < ?', 1.week.ago).destroy_all
  end

  def self.last_created_projects(max)
    order('created_at DESC').limit(max)
  end

  def self.first_updated_projects(max)
    order('updated_at ASC').limit(max)
  end
end
