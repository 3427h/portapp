class TasksController < ApplicationController
  def index
    tasks = Task.all
    @tasks = tasks.select do |t|
      t.group_id == current_group.id || t.group_id == 100
    end
  end

  def new
    @task = Task.new
  end

  def edit
    @task = current_group.tasks.find_by(id: params[:id])
    @task ||= Group.find(100).tasks.find(params[:id])
  end

  def show
    @task = current_group.tasks.find_by(id: params[:id])
    @task ||= Group.find(100).tasks.find(params[:id])
  end

  def create
    if task_params[:group_id] == "0"
      @task = Group.find(100).tasks.new(task_params)
    else
      @task = current_group.tasks.new(task_params)
    end
    if @task.save
      redirect_to tasks_url, notice: "登録しました"
    else
      render :new
    end
  end

  def update
    task = current_group.tasks.find_by(id: params[:id])
    task ||= Group.find(100).tasks.find(params[:id])
    if task.update(task_params)
      redirect_to tasks_url
    else
      render :edit
    end
  end

  def destroy
    task = current_group.tasks.find_by(id: params[:id])
    task ||= Group.find(100).tasks.find(params[:id])
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
