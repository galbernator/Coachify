class EmployeesController < ApplicationController
  def create
    location = Location.find(params[:employee][:location_id])
    @employee = Employee.new(employee_params)
    @employee.location = location
    @employee.district = location.district
    if @employee.save
      redirect_to company_location_path(location.company, location)
    else
      redirect_to company_locatoin_path(location.company, location)
    end
  end

  def destroy
    employee = Employee.find params[:id]
    employee.destroy
    company = Company.find current_user.company_id
    redirect_to company_path(company)
  end

  private

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :location_id)
  end
end
