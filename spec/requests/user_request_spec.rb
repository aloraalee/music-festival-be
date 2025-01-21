require "rails_helper"

RSpec.describe "Users", type: :request do
  before :each do
    @user_1 = create(:user)
    @user_2 = create(:user)
    @user_3 = create(:user)

    @schedule_1 = create(:schedule, user_id: @user_1.id)
    @schedule_2 = create(:schedule, user_id: @user_1.id)
    
    @schedule_3 = create(:schedule, user_id: @user_2.id)
    @schedule_4= create(:schedule, user_id: @user_2.id)

    @schedule_4 = create(:schedule, user_id: @user_3.id)
    @schedule_5= create(:schedule, user_id: @user_3.id)

    @show_1 = create(:show)
    @show_2 = create(:show)
    @show_3 = create(:show)
    @show_4 = create(:show)
    @show_5 = create(:show)
    @show_6 = create(:show)
    @show_7 = create(:show)
    @show_8 = create(:show)
    @show_9 = create(:show)
    @show_10 = create(:show)

    @schedule_1.shows << @show_1
    @schedule_1.shows << @show_2
    @schedule_1.shows << @show_3

    @schedule_2.shows << @show_9
    @schedule_2.shows << @show_10
    
    @schedule_3.shows << @show_1
    @schedule_3.shows << @show_2
    @schedule_3.shows << @show_3

    @schedule4.shows << @show_4
    @schedule4.shows << @show_5
    @schedule4.shows << @show_6
    @schedule4.shows << @show_7
    @schedule4.shows << @show_8

    @schedule5.shows << @show_3
  end

  describe "Get All Users Endpoint" do
    it "retrieves all users" do

      get api_v1_users_path

      expect(response).to be_successful
      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:data].count).to eq(3)
      expect(json[:data][0][:attributes]).to have_key(:first_name)
      expect(json[:data][0][:attributes]).to have_key(:last_name)
      expect(json[:data][0][:attributes]).to have_key(:email)
    end
  end