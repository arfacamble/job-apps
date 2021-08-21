class ApplicationsController < ApplicationController
  def index
    @applications = Application.all
  end

  def edit
  end
end
