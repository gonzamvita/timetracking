class EntriesController < ApplicationController
  def index
    @project = Project.find_by(id: params[:project_id]) || render_404(params)
    date = Date.current
    @entries = Entry.where(
      project_id: params[:project_id]).where(
        date: date.beginning_of_month..date.end_of_month)
  end

  def new
    @project = Project.find(params[:project_id])
    @entry = @project.entries.new
  end

  def create
    @project = Project.find(params[:project_id])
    @entry = @project.entries.new(entry_params)

    if @entry.save
      flash[:notice] = 'Entry saved succesfully'
      redirect_to action: 'index', controller: 'entries', project_id: @project.id
    else
      flash.now[:alert] = @entry.errors.full_messages
      render 'new'
    end
  end

  def edit
    @project = Project.find(params[:project_id])
    @entry = @project.entries.find(params[:id])
  end

  def update
    @entry = Entry.find(params[:id])
    if @entry.update_attributes(entry_params)
      flash[:notice] = 'Entry updated succesfully'
      redirect_to action: 'index'
    else
      flash.now[:errors] = @entry.errors.full_messages
      render 'edit'
    end
  end

  def destroy
    @project = Project.find(params[:project_id])
    @entry = @project.entries.find(params[:id])

    if @entry.destroy
      redirect_to action: 'index'
    end
  end

  private
  def entry_params
    params.require(:entry).permit(:hours, :minutes, :date)
  end
end
