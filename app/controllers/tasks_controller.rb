class TasksController < ApplicationController
  def index
    @tasks = current_group.tasks
  end

  def new
    @task = Task.new
  end

  def edit
    @task = current_group.tasks.find(params[:id])
  end

  def show
    @task = current_group.tasks.find(params[:id])
  end

  def create
    @task = current_group.tasks.new(task_params)
    if @task.save
      redirect_to tasks_url, notice: "登録しました"
    else
      render :new
    end
  end

  def update
    task = current_group.tasks.find(params[:id])
    if task.update(task_params)
      redirect_to tasks_url
    else
      render :edit
    end
  end

  def destroy
    task = current_group.tasks.find(params[:id])
    task.destroy
    redirect_to tasks_url
  end

  private
  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:date, :title, :task, :group_id)
  end

end
