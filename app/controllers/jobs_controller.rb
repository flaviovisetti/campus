class JobsController < ApplicationController
  def show
      id = params[:id]
      @job = Job.find(id)
  end
end
