class JobsController < ApplicationController
  def index
    @jobs = Job.includes(:quotes, :bulletpoints).all.order(start_date: :desc)
  end

  def edit
    @job = Job.includes(:quotes, :bulletpoints).find(params[:id])
    @bulletpoint = Bulletpoint.new
  end

  def update
  end
end
