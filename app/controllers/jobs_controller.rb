class JobsController < ApplicationController

  def show
      id = params[:id]
      @job = Job.find(id)
  end

  def new
    @job = Job.new
  end

  def create
    new_job = params.require(:job).permit(:title, :location, :category, :company_id, :description)
    @job = Job.new(title: new_job[:title], location: new_job[:location], category: new_job[:category], company_id: new_job[:company_id], description: new_job[:description])
    @job.save

    if @job.save
      redirect_to job_url(@job)
    else
      redirect_to new_job_path, flash: {referal_msg: 'Não foi possível criar a vaga'}
    end

  end
end
