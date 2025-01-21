class Show < ApplicationRecord
  has_many :schedule_items
  has_many :schedules, through: :schedule_items
  validates :artist, presence: true
  validates :location, presence: true
  validates :show_time, presence: true
end
