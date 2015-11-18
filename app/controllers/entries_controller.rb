class EntriesController < ApplicationController
  def index
    @project = Project.find_by(id: params[:project_id]) || render_404(params)
    # @entries = @project.entries
    date = Date.current
    @entries = Entry.where(
      project_id: params[:project_id]).where(
        date: date.beginning_of_month..date.end_of_month)

    @total_hours = @project.total_hours_in_month(date.month, date.year)
  end
end
