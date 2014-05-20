class ScheduleController < ApplicationController
  before_action :authenticate_user!
  def index
    @tasks = current_user.tasks.order(:due)
    @date = Date.current
    @date = params[:month] ? Date.parse("#{params[:year]}-#{params[:month]}-01") : Date.parse("#{params[:year]}-01-01") if params[:year]
  end

  def show
    date = Date.parse("#{params[:year]}-#{params[:month]}-#{params[:day]}")
    @tasks_due = current_user.tasks.where(due: date.beginning_of_day..date.end_of_day).order(:due)
    #@earliest = @tasks_due
    @tasks_to_work_on = current_user.tasks.where "due <= ?", date.end_of_day
  end
end
