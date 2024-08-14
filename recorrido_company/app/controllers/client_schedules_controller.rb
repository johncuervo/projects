class ClientSchedulesController < ApplicationController
    def index
        @clients = Client.all
    end

    def show
        @client_schedule = ClientSchedule.find(params[:id])
    end

    def new
        @client = Client.find(params[:client_id])
        @client_schedule = @client.client_schedules.new
    end

    def create
        @client = Client.find(params[:client_id])
        @client_schedule = @client.client_schedules.new(client_schedule_params)
        if @client_schedule.save
            redirect_to [@client, @client_schedule], notice: 'Client Schedule was successfully created.'
        else
            render :new
        end
    end

    def load_schedules
        if params[:schedule] && params[:schedule][:client_id] && params[:schedule][:week_number]
            @client = Client.find(params[:schedule][:client_id])
            @supporter_employees = SupporterEmployee.all
            @week_number = params[:schedule][:week_number].to_i
            @start_date, @end_date = dates_for_week(@week_number, Time.current.year)
            @client_schedules = @client.client_schedules.where(day_of_week: %w[monday tuesday wednesday thursday friday saturday sunday])
            @schedule_assignments = ScheduleAssignment.where(client: @client, time: @start_date..@end_date)

            @supporter_hours = @supporter_employees.map do |employee|
                assigned_hours = @schedule_assignments.where(client_id: @client.id, supporter_employee_id: employee.id, time: @start_date..@end_date).count
                {
                employee: employee,
                assigned_hours: assigned_hours
                }
            end

            total_assigned_hours = @schedule_assignments.count

            total_client_schedule_hours = @client_schedules.sum do |cs|
                (cs.end_hour - cs.start_hour) / 1.hour
            end

            total_unassigned_hours = total_client_schedule_hours.to_i - total_assigned_hours.to_i
            total_unassigned_hours = '' #Pending to fix logic

            respond_to do |format|
                format.html { render partial: 'client_schedules/schedules', locals: { client_schedules: @client_schedules, schedule_assignments: @schedule_assignments,
                                                                                    client: @client, week_number: @week_number, start_date: @start_date, end_date: @end_date,
                                                                                    supporter_hours: @supporter_hours, total_unassigned_hours: total_unassigned_hours } }
            end
        end
    end

    private

    def client_schedule_params
        params.require(:client_schedule).permit(:start_hour, :end_hour, :day_of_week)
    end

    def dates_for_week(week_number, year)
        start_date = Date.commercial(year, week_number, 1)
        end_date = start_date + 6.days
        [start_date, end_date]
    end
end
