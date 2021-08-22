class ApplicationsController < ApplicationController
  def index
    @applications = Application.all
  end

  def edit
    @application = Application.includes(:competencies, :cover_paras, :values).find(params[:id])
  end
end
