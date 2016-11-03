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
      redirect_to new_job_path, flash: { referral_code: 'Não foi possível criar a vaga' }
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    edit_job_params = params.require(:job).permit(:title, :location, :category, :description, :featured, :company_id)
    @job = Job.new(edit_job_params)

    if @job.save
      redirect_to job_path(@job)
    else
      redirect_to edit_job_path, flash: { referral_code: 'Não foi possível atualizar a vaga' }
    end
  end

end
