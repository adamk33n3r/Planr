class ScheduleController < ApplicationController
  before_action :authenticate_user!
  def index
    @tasks = current_user.tasks
    @date = Date.current
    @date = params[:month] ? Date.parse("#{params[:year]}-#{params[:month]}-01") : Date.parse("#{params[:year]}-01-01") if params[:year]
  end
end
