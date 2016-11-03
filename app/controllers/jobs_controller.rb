class JobsController < ApplicationController

  def show
      @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
    @companies = Company.all
  end

  def create
    @job = Job.new(params_job)

    if @job.save
      redirect_to job_path(@job)
    else
      @companies = Company.all
      flash.now[:alert] = 'Não foi possível criar a vaga'
      render :new
    end
  end

  def edit
    @job = Job.find(params[:id])
    @companies = Company.all
  end

  def update
    @job = Job.find(params[:id])

    if @job.update(params_job)
      redirect_to job_path(@job)
    else
      @companies = Company.all
      flash.now[:alert] = 'Não foi possível atualizar a vaga'
      render :edit
    end
  end

  private

  def params_job
    params.require(:job).permit(:title, :location, :category, :description, :featured, :company_id)
  end

end
