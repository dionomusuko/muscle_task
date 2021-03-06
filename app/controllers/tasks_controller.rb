class TasksController < ApplicationController
  #before_action :set_task, only: %i[show edit update destroy]

  def index
    if current_user
      @tasks = current_user.tasks
    else
      redirect_to root_path, notice: "ログインしてください"
    end
  end

  def show
     set_task
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.new(task_params)

    if @task.save
      redirect_to @task, notice: "タスク「#{@task.name}」を登録しました。"
    else
      render :new
    end
  end

  def destroy
    set_task
    @task.destroy
    redirect_to tasks_url, notice: "タスク「#{@task.name}」を削除しました。"
  end

  def edit
    @task = set_task
  end

  def update
    if @task.update!(task_params)
      redirect_to tasks_url, notice: "タスク「#{@task.name}」を更新しました。"
    else
      render :edit
    end
  end

  private
  def task_params
    params.require(:task).permit(:name, :menu, :time, :rep, :set, :comment)
  end

  def set_task
    @task = current_user.tasks.find(params[:id])
  end
end