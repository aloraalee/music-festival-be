class ScheduleItem < ApplicationRecord
  belongs_to :schedule
  belongs_to :show
end
