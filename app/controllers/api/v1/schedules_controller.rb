class Api::V1::SchedulesController < ApplicationController
  def index
    schedules = Schedule.all 
    render json: ScheduleSerializer.new(schedules), status: :ok
  end

  def show
    schedule = Schedule.find(params[:id])  
    render json: ScheduleSerializer.new(schedule, include: ['shows']).serializable_hash 
  end

  # def show
  #   schedule = Schedule.find(params[:id])
  #   if itinerary_params[:shows].present? 
  #     Schedule.add_show(schedule_params[:id])
  #     render json: 
  #   else
  #   render json: ScheduleSerializer.new(schedule)
  # end

  private

  def schedule_params
    params.permit(:title, :date)
  end
end