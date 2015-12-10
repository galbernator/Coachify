class LocationsController < ApplicationController

  def create
    district = District.find_by_id(params[:location][:district_id])
    @location = Location.new(location_params)
    @location.company = district.company
    if @location.save
      redirect_to (:back)
    else
      render :new
    end
  end

  def show
    @location = Location.find params[:id]
  end

  def edit
    @location = Location.find(params[:id])
  end

  def update
    @location = Location,find(params[:id])
    if @location.update(location_params)
      redirect_to @location
    else
      render :edit
    end
  end

  def destroy
    @company = Company.find(params[:company_id])
    @location = Location.find(params[:id])
    @location.destroy
    redirect_to @company
  end

  private

  def location_params
    params.require(:location).permit([:name, :address, :city, :state, :zip_code, :phone_number, :district_id])
  end

end
