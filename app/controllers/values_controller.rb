class ValuesController < ApplicationController
  def create
    value = Value.find(params[:value_id])
    app = Application.find(params[:application_id])
    AppValue.create(value: value, application: app)
    redirect_to edit_application_path(app)
  end

  def destroy
    AppValue.where(value: params[:id], application: params[:application_id]).first.destroy
    redirect_to edit_application_path(params[:application_id])
  end

  def create_new
    app = Application.find(params[:application_id])
    value = Value.new(value_params)
    value.save
    AppValue.create(application: app, value: value)
    redirect_to edit_application_path(app)
  end

  private

  def value_params
    params.require(:value).permit(:title, :image_url, :text)
  end
end
