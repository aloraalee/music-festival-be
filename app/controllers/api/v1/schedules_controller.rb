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

  private

  def schedule_params
    params.permit(:title, :date)
  end
end