class EmployeesController < ApplicationController

  def show
    @employee = Employee.find(params[:id])
  end

  def update
    @employee = Employee.find(params[:id])
    @employee_ticket = EmployeeTicket.create(employee_id: @employee.id, ticket_id: params[:ticket_id])
    redirect_to "/employees/#{@employee.id}"
  end

  private
  def employee_params
    params.require(:employee).permit(:name, :level, :department_id)
  end

end