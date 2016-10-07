class Api::V1::TasksController < ApplicationController
  def index
    @tasks = Task.all
    render json: { data: @tasks }
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      render json: { data: @task }
    else
      render json: { data: @task}, status: :error
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :memo)
  end
end
