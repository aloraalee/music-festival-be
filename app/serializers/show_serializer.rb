class ShowSerializer
  include JSONAPI::Serializer
  attributes :artist, :location, :show_time
end
