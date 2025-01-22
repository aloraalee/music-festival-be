class Api::V1::SchedulesController < ApplicationController
  def index
    schedules = Schedule.all 
    render json: ScheduleSerializer.new(schedules), status: :ok
  end

  def show
    schedule = Schedule.find_by(id: params[:id])  
    if schedule
      render json: ScheduleSerializer.new(schedule, include: ['shows']).serializable_hash 
    else
      render json: { error: "Schedule not found" }, status: :not_found
    end
  end

  def destroy
    schedule = Schedule.find_by(id: params[:schedule_id])
    show = Show.find_by(id: params[:show_id])
    if schedule && show
      schedule.shows.delete(show)
      render json: { message: "Show removed from schedule" }, status: :ok
    else
      render json: { error: "Schedule or Show not found" }, status: :not_found
    end
  end
end