class Show < ApplicationRecord
  has_many :schedule_shows
  has_many :schedules, through: :schedule_shows
  validates :artist, presence: true
  validates :location, presence: true
  validates :show_time, presence: true
end
