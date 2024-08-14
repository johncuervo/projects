class SupporterEmployeesController < ApplicationController
    def index
        @supporter_employees = SupporterEmployee.all
    end

    def show
        @supporter_employee = SupporterEmployee.find(params[:id])
    end

    def new
        @supporter_employee = SupporterEmployee.new
    end

    def create
        @supporter_employee = SupporterEmployee.new(supporter_employee_params)
        if @supporter_employee.save
            redirect_to @supporter_employee, notice: 'Supporter Employee was successfully created.'
        else
            render :new
        end
    end

    private

    def supporter_employee_params
        params.require(:supporter_employee).permit(:name, :assigned_color)
    end
end
