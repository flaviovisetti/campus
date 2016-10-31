class JobsController < ApplicationController
  def show
      id = params[:id]
      @job = Job.find(id)
  end

  def new
    @job = Job.new
  end

  def create
    new_job = params.require(:job).permit(:title, :location, :category, :company, :description)
    @job = Job.new(title: new_job[:title], location: new_job[:location], category: new_job[:category], company: new_job[:company], description: new_job[:description])
    @job.save
    redirect_to job_url(@job)

  end
end
