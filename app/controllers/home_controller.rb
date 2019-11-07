class HomeController < ApplicationController
  def index
    @users = User.all
    # @tasks = @users.task_params
  end

  private
  def task_params
    params.require(:task).permit(:name, :menu, :time, :rep, :set, :comment)
  end
end
