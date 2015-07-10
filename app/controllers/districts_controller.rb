class DistrictsController < ApplicationController

  def index
    company = current_user.company.id
    @districts = District.where(company_id: company)
  end

  def new
    @company = get_company
    @district = District.new
  end

  def create
    company = get_company
    @district = District.new(district_params)
    @district.company = company
    if @district.save
      redirect_to company_district_path(company, @district)
    else
      render :new
    end
  end

  def show
    @district = District.find(params[:id])
    @location = Location.new
    @states = us_states
  end

  def edit
      @district = District.find params[:id]
  end

  def update
    @company = get_company
    @district = District.find params[:id]
    if @district.update(district_params)
      redirect_to @district
    else
      render :edit
    end
  end

  def destroy
      company = get_company
      district = District.find params[:id]
      district.destroy
      redirect_to company_path(company)
  end

  private

  def get_company
    @company = Company.friendly.find params[:company_id]
  end

  def district_params
    params.require(:district).permit([:name])
  end

  def us_states
    [
      ['Alabama', 'AL'],
      ['Alaska', 'AK'],
      ['Arizona', 'AZ'],
      ['Arkansas', 'AR'],
      ['California', 'CA'],
      ['Colorado', 'CO'],
      ['Connecticut', 'CT'],
      ['Delaware', 'DE'],
      ['District of Columbia', 'DC'],
      ['Florida', 'FL'],
      ['Georgia', 'GA'],
      ['Hawaii', 'HI'],
      ['Idaho', 'ID'],
      ['Illinois', 'IL'],
      ['Indiana', 'IN'],
      ['Iowa', 'IA'],
      ['Kansas', 'KS'],
      ['Kentucky', 'KY'],
      ['Louisiana', 'LA'],
      ['Maine', 'ME'],
      ['Maryland', 'MD'],
      ['Massachusetts', 'MA'],
      ['Michigan', 'MI'],
      ['Minnesota', 'MN'],
      ['Mississippi', 'MS'],
      ['Missouri', 'MO'],
      ['Montana', 'MT'],
      ['Nebraska', 'NE'],
      ['Nevada', 'NV'],
      ['New Hampshire', 'NH'],
      ['New Jersey', 'NJ'],
      ['New Mexico', 'NM'],
      ['New York', 'NY'],
      ['North Carolina', 'NC'],
      ['North Dakota', 'ND'],
      ['Ohio', 'OH'],
      ['Oklahoma', 'OK'],
      ['Oregon', 'OR'],
      ['Pennsylvania', 'PA'],
      ['Puerto Rico', 'PR'],
      ['Rhode Island', 'RI'],
      ['South Carolina', 'SC'],
      ['South Dakota', 'SD'],
      ['Tennessee', 'TN'],
      ['Texas', 'TX'],
      ['Utah', 'UT'],
      ['Vermont', 'VT'],
      ['Virginia', 'VA'],
      ['Washington', 'WA'],
      ['West Virginia', 'WV'],
      ['Wisconsin', 'WI'],
      ['Wyoming', 'WY']
    ]
  end

end
