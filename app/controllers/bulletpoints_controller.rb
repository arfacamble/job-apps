class BulletpointsController < ApplicationController
  def update
    point = Bulletpoint.find(params[:id])
    point.update(bulletpoint_params)
    redirect_to edit_job_path(point.card)
  end

  def create
    # currently ish ready to work for different pointable models but set up nly for jobs
    if params[:job_id]
      card = Job.find(params[:job_id])
    end
    point = Bulletpoint.new(bulletpoint_params)
    point.card = card
    point.save
    redirect_to edit_job_path(card)
  end

  def destroy
    point = Bulletpoint.find(params[:id])
    point.destroy
    redirect_to edit_job_path(point.card)
  end

  private

  def bulletpoint_params
    params.require(:bulletpoint).permit(:text)
  end
end
