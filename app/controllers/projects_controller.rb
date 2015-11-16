class ProjectsController < ApplicationController
  def index
    @projects = Project.last_created_projects(5)
  end

  # def last_created_projects(n)

  # end
end
