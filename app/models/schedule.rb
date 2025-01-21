class Schedule < ApplicationRecord
  belongs_to :user
  has_many :schedule_items
  has_many :shows, through: :schedule_items
  validates :title, presence: true
  validates :date, presence: true
end
