class Api::V1::SchedulesController < ApplicationController
  def index
    schedules = Schedule.all 
    render json: ScheduleSerializer.new(schedules), status: :ok
  end
end