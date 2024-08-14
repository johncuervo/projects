class ScheduleAssignmentsController < ApplicationController
  def create
      client_schedule = ClientSchedule.find(params[:client_schedule_id])
      supporters = SupporterEmployee.available_supporters(client_schedule.day_of_week)

      ScheduleAssignmentService.new(client_schedule, supporters).assign_hours

      redirect_to client_schedule_path(client_schedule), notice: 'Assignments created successfully'
  end
end
