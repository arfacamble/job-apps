class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  after_filter :cors

  def cors
    response.headers['Access-Control-Allow-Origin'] = '*'
  end
end
