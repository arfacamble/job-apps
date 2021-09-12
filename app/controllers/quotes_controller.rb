class QuotesController < ApplicationController
  def create
    job = Job.find(params[:job_id])
    quote = Quote.new(quote_params)
    quote.job = job
    quote.save
    redirect_to edit_job_path(job)
  end

  def update
    q = Quote.find(params[:id])
    q.update(quote_params)
    redirect_to edit_job_path(q.job)
  end

  def destroy
    q = Quote.find(params[:id])
    job = q.job
    q.destroy
    redirect_to edit_job_path(job)
  end

  private

  def quote_params
    params.require(:quote).permit(:author, :text)
  end
end
