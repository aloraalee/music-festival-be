class ScheduleSerializer
  include JSONAPI::Serializer
  attributes :title, :date, :user_id
  has_many :shows
end
