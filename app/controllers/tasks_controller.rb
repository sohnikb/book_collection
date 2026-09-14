class TasksController < ApplicationController
  def index
    @page = params[:page].to_i
    @tasks = ['Fold laundry', 'Sweep porch', 'Wash dishes']
  end

  def new
  end

  def edit
  end
end
