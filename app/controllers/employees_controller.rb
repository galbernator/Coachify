class EmployeesController < ApplicationController
  def create
    location = params[:location_id]
    employee_params = params.require(:employee).permit(:first_name, :last_name)
    @employee = Employee.new(employee_params)
    if @employee.save
      redirect_to :back
    else
      redirect_to company_district_path(district)
  end

  def destroy

  end
end
