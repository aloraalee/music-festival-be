require 'rails_helper'

RSpec.describe Show, type: :model do
  describe "relationships" do
    it {should have_many :schedule_shows}
    it {should have_many(:schedules) .through(:schedule_shows)}
  end

  describe "validations" do
    it { should validate_presence_of(:artist) }
    it { should validate_presence_of(:location) }
    it { should validate_presence_of(:show_time) }
  end
end
