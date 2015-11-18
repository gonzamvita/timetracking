class Entry < ActiveRecord::Base
  belongs_to(:project)
  validates :hours, presence: true
  validates :hours, numericality: true
  validates :minutes, presence: true
  validates :minutes, numericality: true
  validates :project_id, presence: true
end
