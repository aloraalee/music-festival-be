require "rails_helper"

RSpec.describe "Schedules", type: :request do
  before :each do
    @user_1 = create(:user)
    @user_2 = create(:user)
    @user_3 = create(:user)

    @schedule_1 = create(:schedule, user_id: @user_1.id)
    @schedule_2 = create(:schedule, user_id: @user_1.id)
    
    @schedule_3 = create(:schedule, user_id: @user_2.id)

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

    @schedule_4.shows << @show_4
    @schedule_4.shows << @show_5
    @schedule_4.shows << @show_6
    @schedule_4.shows << @show_7
    @schedule_4.shows << @show_8

    @schedule_5.shows << @show_3
  end

  describe "Get All Schedules Endpoint" do
    it "retrieves all schedules" do

      get api_v1_schedules_path

      expect(response).to be_successful
      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:data].count).to eq(5)
      expect(json[:data][0][:attributes]).to have_key(:title)
      expect(json[:data][0][:attributes]).to have_key(:date)
      expect(json[:data][0][:attributes]).to have_key(:user_id)
    end
  end

    it "should return all shows for a given schedule" do
      get "/api/v1/schedules/#{@schedule_1.id}"

      expect(response).to be_successful
      json = JSON.parse(response.body, symbolize_names: true)
      expect(json[:data][:relationships][:shows][:data].count).to eq(3)
      expect(json[:data][:relationships][:shows][:data][0][:id]).to eq(@show_1.id.to_s)
      expect(json[:data][:relationships][:shows][:data][1][:id]).to eq(@show_2.id.to_s)
      expect(json[:data][:relationships][:shows][:data][2][:id]).to eq(@show_3.id.to_s)
    end

    it "should return all show details for a given schedule" do
      get "/api/v1/schedules/#{@schedule_1.id}"

      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(json[:included][0][:attributes]).to have_key(:artist)
      expect(json[:included][0][:attributes]).to have_key(:location)
      expect(json[:included][0][:attributes]).to have_key(:show_time)
    end

  it "should return 404 and error message when schedule is not found" do
    get "/api/v1/schedules/100000"

    json = JSON.parse(response.body, symbolize_names: true)
    expect(response).to have_http_status(:not_found)
    expect(json[:error]).to eq("Schedule not found")
  end

  describe "Delete Show from a Schedule" do
    it "deletes a show from a schedule" do
      expect(@schedule_4.shows).to include(@show_8)
      expect(Show.count).to eq(10)

      delete "/api/v1/schedules/#{@schedule_4.id}/remove_show/#{@show_8.id}"

      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(Show.count).to eq(10)
      expect(json[:message]).to eq("Show removed from schedule")
      expect(@schedule_4.shows).not_to include(@show_8)
    end
  end
end