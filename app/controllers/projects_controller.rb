class ProjectsController < ApplicationController

  def index
    render :index
  end

  def show
    p "SHOWING"
  end

  def create
    p "CREATING"
  end

end
