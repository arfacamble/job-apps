class CompetenciesController < ApplicationController
  def create
    application = Application.find(params[:application_id])
    comp = Competency.find(params[:competency_id])
    AppCompetency.create(application: application, competency: comp)
    redirect_to edit_application_path(application)
  end

  def destroy
    AppCompetency.where(application: params[:application_id], competency: params[:id]).first.destroy
    redirect_to edit_application_path(params[:application_id])
  end

  def create_new
    app = Application.find(params[:application_id])
    comp = Competency.new(competency_params)
    comp.save
    AppCompetency.create(application: app, competency: comp)
    redirect_to edit_application_path(app)
  end

  private

  def competency_params
    params.require(:competency).permit(:title, :image_url, :text)
  end
end
