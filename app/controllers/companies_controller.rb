class CompaniesController < ApplicationController
  def new
    @company = Company.new
  end

  def create
    company = Company.new(params_company)
    company.save
    redirect_to company_url(company)
  end

  def show
    @company = Company.find(params[:id])
    @company_jobs = @company.jobs
  end

  private

  def params_company
    params.require(:company).permit(:name, :location, :mail, :phone)
  end

end
