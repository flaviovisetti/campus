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
    redirect_to job_url(new_job)


  end
end
