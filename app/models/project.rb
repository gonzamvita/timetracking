class Project < ActiveRecord::Base
  has_many(:entries)
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :name, length: {maximum: 30}
  validates :name, format: {with: /[A-Za-z0-9\s]/}

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

  def total_hours_in_month(month, year)
    date = Time.new(year, month)
    binding.pry
    project_entries = self.entries.where(date: date.beginning_of_month..date.end_of_month)
    total_minutes = project_entries.reduce(0) do |sum, entry|
      sum + entry.minutes + entry.hours*60
    end
    total_hours = total_minutes/60.0
  end
end
