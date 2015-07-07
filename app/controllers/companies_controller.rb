class CompaniesController < ApplicationController

  before_action :find_company, except: [:index, :new, :create]


  def index
    @companies = Company.all
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    nickname = params[:name].split(" ").join('')
    @company.nickname = nickname
    if @company.save
      # send email invite to company lead to sign up for admin account and then
      # directly redirect to fill out the remainder of the company details
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @evaluation = Evaluation.new
  end

  def edit
  end

  def update
    if @company.update(company_params)
      redirect_to @company
    else
      render :edit
    end
  end

  def destroy
    @company.destroy
    redirect_to companies_path, notice: "Company has been removed"
  end

  private

  def company_params
    params.require(:company).permit([:name, :address, :phone_number,
                                :first_name, :last_name, :email, :slug])
  end

  def find_company
    @company = Company.friendly.find(params[:id])
  end

end
