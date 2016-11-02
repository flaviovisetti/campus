class JobsController < ApplicationController
  def show
      id = params[:id]
      @job = Job.find(id)
  end

  def new
    @job = Job.new
  end

  def create
    new_job_params = params.require(:job).permit(:title, :location, :category, :description, :featured, :company_id)
    @job = Job.new(new_job_params)

    if @job.save
      redirect_to job_path(@job)
    else
      @error = 'Não foi possível criar a vaga'
    end

  end
end
